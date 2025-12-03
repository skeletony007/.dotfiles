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

    dir = os.getenv("WORK") .. "/webots.nvim",

    config = function()
        local webots = require("webots")
        webots.openjdk.setup()
        webots.jdtls.setup()
    end,
}
