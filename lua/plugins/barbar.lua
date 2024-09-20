return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function() vim.g.barbar_auto_setup = false end,
  config = function()
    require("barbar").setup({
      sideBar_filetypes = {
        ["neo-tree"] = true
      },
      animation = true,
      insert_at_start = true,
    });
    ---@diagnostic disable-next-line: different-requires
    require("mapping.barbar");
  end,
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
