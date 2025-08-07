return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
      },
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" }
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local function nmap(keybind, callback, description)
        local opts = { buffer = buffer, desc = description, silent = true }
        vim.keymap.set("n", keybind, callback, opts)
      end

      local on_attach = function()
        nmap("<leader>gR", "<cmd>Telescope lsp_references<CR>", "Show LSP references")
        nmap("<leader>gD", vim.lsp.buf.declaration, "Go to declaration")
        nmap("<leader>gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions")
        nmap("<leader>gi", "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations")
        nmap("<leader>gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions")
        nmap("<leader>ca", vim.lsp.buf.code_action, "See available code actions")
        nmap("<leader>rn", vim.lsp.buf.rename, "Smart rename")
        nmap("<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics")
        nmap("<leader>d", vim.diagnostic.open_float, "Show line diagnostics")
        nmap("[d", vim.diagnostic.goto_prev, "Go to previous diagnostic")
        nmap("]d", vim.diagnostic.goto_next, "Go to next diagnostic")
        nmap("K", vim.lsp.buf.hover, "Show documentation for what is under cursor")
        nmap("<leader>rs", ":LspRestart<CR>", "Restart LSP")
      end

      local opts = {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      mason_lspconfig.setup({
        ensure_installed = {
          "angularls",
          "cssls",
          "html",
          "lua_ls",
          "ts_ls",
          "jdtls",
          "emmet_ls",
          "rust_analyzer"
        },
        automatic_installation = true,
        handlers = {
          function(servername)
            lspconfig[servername].setup(opts)
          end,
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup {
              on_attach = on_attach,
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" }
                  },
                }
              }
            }
          end,
          ["ts_ls"] = function()
            lspconfig.ts_ls.setup({
              settings = {
                quoteStyle = "single"
              }
            })
          end
        }
      })
    end
  },
}
