return {
  {
    "m4xshen/autoclose.nvim",
    event = { "VeryLazy" },
    config = function()
      local autoclose = require("autoclose")
      autoclose.setup()
    end,
  }
}
