return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    auto_install = true,
    -- highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = { enable = true },
    ensure_installed = {
      "html",
      "css",
      "scss",
      "typescript",
    },
    build = ":TSUpdate"
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end
}
