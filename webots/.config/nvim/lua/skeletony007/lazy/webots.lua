return {
    "skeletony007/webots.nvim",

    cmd = {
        "Webots",
        "WebotsRealtime",
        "WebotsFast",

        -- currently only implemented for openJDK
        "WebotsExternRobotController",
    },

    ft = "java",

    config = function()
        local webots = require("webots")
        webots.openjdk.setup()
        webots.jdtls.setup()
    end,
}
