return {
   "savq/melange-nvim",
   lazy = false,
   priority = 1000,
   config = function()
      -- Load the colorscheme first
      vim.cmd.colorscheme("melange")

      -- Semi-transparent glossy effect with actual transparency
      local glossy_groups = {
         "Normal",        -- Main editor text
         "NormalNC",      -- Inactive windows
         "LineNr",        -- Line numbers
         "FoldColumn",    -- Fold markers
         "SignColumn",    -- Gutter for git signs/diagnostics
         "EndOfBuffer",   -- The empty space below the end of a file
         "NormalFloat",   -- Floating windows (e.g., LSP popups)
         "FloatBorder"    -- Borders around floating windows
      }

      -- Create actual transparent background for blur-capable GUIs/compositors
      local transparent_groups = {
         "Normal", "NormalNC", "LineNr", "CursorLineNr", "CursorColumn",
         "FoldColumn", "SignColumn", "EndOfBuffer", "NonText",
         "NormalFloat", "FloatBorder", "Pmenu", "PmenuSel",
         "PmenuSbar", "PmenuThumb", "StatusLine", "StatusLineNC",
         "TabLine", "TabLineSel", "TabLineFill",
      }

      for _, group in ipairs(transparent_groups) do
         vim.cmd(string.format("hi %s guibg=NONE ctermbg=NONE", group))
      end
   end,
}
