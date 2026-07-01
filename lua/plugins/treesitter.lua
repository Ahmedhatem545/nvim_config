return {
   "nvim-treesitter/nvim-treesitter",
   build = ":TSUpdate",
   lazy = false,

   config = function()
      local ok, configs = pcall(require, "nvim-treesitter.config")
      if not ok then return end

      configs.setup({
         ensure_installed = {
            "html",
            "tsx",
            "typescript",
            "javascript",
            "svelte",
            "vue",
         },
         auto_install = true,
         sync_install = false,

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
