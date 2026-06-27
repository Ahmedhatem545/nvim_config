return {
   "savq/melange-nvim",
   lazy = false,
   priority = 1000,
   config = function()
      -- 1. Load the colorscheme first
      vim.cmd.colorscheme("melange")

      -- 2. Define the UI groups you want to be transparent
      local transparent_groups = {
         "Normal",        -- Main editor text
         "NormalNC",      -- Inactive windows
         "LineNr",        -- Line numbers
         "FoldColumn",    -- Fold markers
         "SignColumn",    -- Gutter for git signs/diagnostics
         "EndOfBuffer",   -- The empty space below the end of a file
         "NormalFloat",   -- Floating windows (e.g., LSP popups)
         "FloatBorder"    -- Borders around floating windows
      }

      -- 3. Loop through and clear the background for each group
      for _, group in ipairs(transparent_groups) do
         vim.cmd(string.format("hi %s guibg=NONE ctermbg=NONE", group))
      end
   end,
}
