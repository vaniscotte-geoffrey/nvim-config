return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "v2.*",
    build = "make install_jsregexp",

    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip").filetype_extend("typescript", {"angular"})
      require("nconf.snippets.all")
    end,
  },
  --
  -- {
  --   'saadparwaiz1/cmp_luasnip',
  -- }
}
