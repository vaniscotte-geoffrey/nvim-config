local lint_command = function(lint)
  local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
  vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    pattern = { "*.js", "*.ts" },
    group = lint_augroup,
    callback = function()
      lint.try_lint()
    end
  })
end

return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  dependencies = {
    "rshkarin/mason-nvim-lint",
    opts = {
      ensure_installed = { "eslint_d" },
      automatic_installation = false,
    },
  },
  config = function()
    local nvim_lint = require("lint")
    local nodejs_formatter = { "eslint_d" }
    nvim_lint.linters_by_ft = {
      javascript = nodejs_formatter,
      typescript = nodejs_formatter,
      javascriptreact = nodejs_formatter,
      typescriptreact = nodejs_formatter,
    }
    lint_command(nvim_lint)
  end
}
