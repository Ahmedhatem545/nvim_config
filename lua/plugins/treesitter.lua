return {
   "nvim-treesitter/nvim-treesitter",
   build = ":TSUpdate",
   event = "VeryLazy",

   config = function()
      local ok, configs = pcall(require, "nvim-treesitter.configs")
      if not ok then return end

      configs.setup({
         auto_install = true,

         highlight = {
            enable = true,
         },

         indent = {
            enable = true,
         },

         autotag = {
            enable = true,
         },
      })
   end,
}
