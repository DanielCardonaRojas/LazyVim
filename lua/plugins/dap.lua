return {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      "jay-babu/mason-nvim-dap.nvim",
      event = "BufReadPre", -- <-- this
    },
  },
  opts = function()
    local dap = require("dap")

    dap.configurations.dart = {
      {
        type = "dart",
        request = "launch",
        name = "Launch flutter",
        dartSdkPath = os.getenv("HOME") .. "/fvm/default/bin/cache/dart-sdk/",
        flutterSdkPath = os.getenv("HOME") .. "/fvm/default/",
        program = "${workspaceFolder}/lib/main.dart",
        cwd = "${workspaceFolder}",
      },
    }
  end,
}
