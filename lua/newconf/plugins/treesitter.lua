return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    auto_install = true,
    highlight = { enable = true },
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
  {
    "nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "angular", "scss" })
      end
      vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
        pattern = { "*.component.html", "*.container.html" },
        callback = function()
          vim.treesitter.start(nil, "angular")
        end,
      })
    end,
  }
}

