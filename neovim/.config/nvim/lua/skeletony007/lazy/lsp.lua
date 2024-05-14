return {
    {
        "williamboman/mason-lspconfig.nvim",

        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },

        config = function()
            require("fidget").setup()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "bashls",
                    --"jdtls", -- choose JAVA 17, see https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/setup-with-nvim-jdtls.md
                    "lua_ls",
                    "marksman", -- create a `.marksman.toml` marker in the root directory (https://github.com/artempyanykh/marksman/blob/main/docs/features.md#workspace-folders-project-roots-and-single-file-mode)
                    "pyright",
                    --"rust_analyzer",
                    "tsserver", -- requires node.js (npm)
                    --"omnisharp",
                    --"texlab",
                },
                handlers = {
                    function(server_name) require("lspconfig")[server_name].setup({}) end,
                    ["lua_ls"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.lua_ls.setup({
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim" },
                                    },
                                },
                            },
                        })
                    end,
                    ["jdtls"] = function() end,
                },
            })
        end,
    },
    {
        "hrsh7th/nvim-cmp",

        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
        },

        config = function()
            local cmp = require("cmp")
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            cmp.setup({
                snippet = {
                    expand = function(args) require("luasnip").lsp_expand(args.body) end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "path" },
                    { name = "buffer" },
                },
            })
        end,
    },
    {
        "mfussenegger/nvim-jdtls",

        ft = "java",

        dependencies = {
            "williamboman/mason-lspconfig.nvim", -- jdtls instlled with mason
            "williamboman/mason.nvim",
            "hrsh7th/nvim-cmp",
        },

        config = function()
            -- see https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/setup-with-nvim-jdtls.md
            local java_cmds = vim.api.nvim_create_augroup("java_cmds", { clear = true })
            local cache_vars = {}

            local root_files = {
                -- Single-module projects
                "build.xml", -- Ant
                "pom.xml", -- Maven
                "settings.gradle", -- Gradle
                "settings.gradle.kts", -- Gradle
                -- Multi-module projects
                "build.gradle",
                "build.gradle.kts",
            }

            local function get_jdtls_paths()
                if cache_vars.paths then
                    return cache_vars.paths
                end

                local path = {}

                path.data_dir = vim.fn.stdpath("cache") .. "/nvim-jdtls"

                local jdtls_install = require("mason-registry").get_package("jdtls"):get_install_path()

                path.java_agent = jdtls_install .. "/lombok.jar"
                path.launcher_jar = vim.fn.glob(jdtls_install .. "/plugins/org.eclipse.equinox.launcher_*.jar")

                if vim.fn.has("mac") == 1 then
                    path.platform_config = jdtls_install .. "/config_mac"
                elseif vim.fn.has("unix") == 1 then
                    path.platform_config = jdtls_install .. "/config_linux"
                elseif vim.fn.has("win32") == 1 then
                    path.platform_config = jdtls_install .. "/config_win"
                end

                path.bundles = {}

                ---
                -- Include java-test bundle if present
                ---
                local java_test_path = require("mason-registry").get_package("java-test"):get_install_path()

                local java_test_bundle = vim.split(vim.fn.glob(java_test_path .. "/extension/server/*.jar"), "\n")

                if java_test_bundle[1] ~= "" then
                    vim.list_extend(path.bundles, java_test_bundle)
                end

                ---
                -- Include java-debug-adapter bundle if present
                ---
                local java_debug_path = require("mason-registry").get_package("java-debug-adapter"):get_install_path()

                local java_debug_bundle = vim.split(
                    vim.fn.glob(java_debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar"),
                    "\n"
                )

                if java_debug_bundle[1] ~= "" then
                    vim.list_extend(path.bundles, java_debug_bundle)
                end

                cache_vars.paths = path

                return path
            end

            local function jdtls_setup(event)
                local jdtls = require("jdtls")

                local path = get_jdtls_paths()
                local data_dir = path.data_dir .. "/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

                if cache_vars.capabilities == nil then
                    jdtls.extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

                    local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
                    cache_vars.capabilities = vim.tbl_deep_extend(
                        "force",
                        vim.lsp.protocol.make_client_capabilities(),
                        ok_cmp and cmp_lsp.default_capabilities() or {}
                    )
                end

                -- The command that starts the language server
                -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
                local cmd = {
                    -- 💀
                    "java",

                    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                    "-Dosgi.bundles.defaultStartLevel=4",
                    "-Declipse.product=org.eclipse.jdt.ls.core.product",
                    "-Dlog.protocol=true",
                    "-Dlog.level=ALL",
                    "-javaagent:" .. path.java_agent,
                    "-Xms1g",
                    "--add-modules=ALL-SYSTEM",
                    "--add-opens",
                    "java.base/java.util=ALL-UNNAMED",
                    "--add-opens",
                    "java.base/java.lang=ALL-UNNAMED",

                    -- 💀
                    "-jar",
                    path.launcher_jar,

                    -- 💀
                    "-configuration",
                    path.platform_config,

                    -- 💀
                    "-data",
                    data_dir,
                }

                local lsp_settings = {
                    java = {
                        eclipse = {
                            downloadSources = true,
                        },
                        configuration = {
                            updateBuildConfiguration = "interactive",
                        },
                        maven = {
                            downloadSources = true,
                        },
                        implementationsCodeLens = {
                            enabled = true,
                        },
                        referencesCodeLens = {
                            enabled = true,
                        },
                        format = {
                            enabled = true,
                        },
                    },
                    signatureHelp = {
                        enabled = true,
                    },
                    completion = {
                        favoriteStaticMembers = {
                            "org.hamcrest.MatcherAssert.assertThat",
                            "org.hamcrest.Matchers.*",
                            "org.hamcrest.CoreMatchers.*",
                            "org.junit.jupiter.api.Assertions.*",
                            "java.util.Objects.requireNonNull",
                            "java.util.Objects.requireNonNullElse",
                            "org.mockito.Mockito.*",
                        },
                    },
                    contentProvider = {
                        preferred = "fernflower",
                    },
                    extendedClientCapabilities = jdtls.extendedClientCapabilities,
                    sources = {
                        organizeImports = {
                            starThreshold = 9999,
                            staticStarThreshold = 9999,
                        },
                    },
                    codeGeneration = {
                        toString = {
                            template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                        },
                        useBlocks = true,
                    },
                }

                -- This starts a new client & server,
                -- or attaches to an existing client & server depending on the `root_dir`.
                jdtls.start_or_attach({
                    cmd = cmd,
                    settings = lsp_settings,
                    capabilities = cache_vars.capabilities,
                    root_dir = jdtls.setup.find_root(root_files),
                    flags = {
                        allow_incremental_sync = true,
                    },
                    init_options = {
                        bundles = path.bundles,
                    },
                })
            end

            vim.api.nvim_create_autocmd("FileType", {
                group = java_cmds,
                pattern = { "java" },
                desc = "Setup jdtls",
                callback = jdtls_setup,
            })
        end,
    },
}
