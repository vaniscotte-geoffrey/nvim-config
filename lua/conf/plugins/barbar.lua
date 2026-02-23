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
    local nmap = require("nconf.utils.nmap")

    nmap("<s-tab>", "<cmd>BufferPrevious<cr>", "Go to the previous tab")
    nmap("<tab>", "<cmd>BufferNext<cr>", "Go to the next tab")
    for i=1,10 do
      nmap("<leader>" .. (i % 10), "<cmd>BufferGoto " .. i .. "<cr>", "Go to the tab " .. i)
    end
    nmap("<c-,>", "<cmd>BufferMovePrevious<cr>", "Move tab to left")
    nmap("<c-.>", "<cmd>BufferMoveNext<cr>", "Move tab to right")
    nmap("<c-<>", "<cmd>BufferScrollLeft<cr>", "Scroll tab to left")
    nmap("<c->>", "<cmd>BufferScrollRight<cr>", "Scroll tab to right")
    nmap("<leader>bc", "<cmd>BufferClose<cr>", "Close the current tab")
    nmap("<leader>bc!", "<cmd>!BufferClose<cr>", "Force close the current tab")
    nmap("<leader>bhc", "<cmd>BufferCloseBuffersLeft<cr>", "Close the left tabs")
    nmap("<leader>blc", "<cmd>BufferCloseBuffersRight<cr>", "Close the right tabs")
    nmap("<leader>boc", "<cmd>BufferCloseAllButCurrent", "Close all but current tabs")
    nmap("<leader>bp", "<cmd>BufferPin<cr>", "Pin/Unpin the current tab")
    nmap("<leader>bbc", "<cmd>BufferCloseAllButCurrent<cr>", "")
    nmap("<leader>bbpc", "<cmd>BufferCloseAllButPinned<cr>", "")
  end,
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
