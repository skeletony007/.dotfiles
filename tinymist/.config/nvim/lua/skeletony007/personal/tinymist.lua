--- @class skeletony007.presonal.Resource
return {
  version = '0.0.1',
  mason_lspconfig = {
    setup = {
      ensure_installed = {
        'tinymist',
      },
      handlers = {
        ['tinymist'] = function(server_name)
          local lspconfig = require('lspconfig')
          local cmp = require('blink.cmp')
          lspconfig['tinymist'].setup({
            capabilities = cmp.get_lsp_capabilities(),
            settings = {
              formatterMode = 'typstyle',
              exportPdf = 'never',
              semanticTokens = 'disable',
            },
          })
        end,
      },
    },
  },
}
