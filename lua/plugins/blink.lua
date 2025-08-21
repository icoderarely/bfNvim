return {
  { "L3MON4D3/LuaSnip", keys = {} },
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    version = "*",
    config = function()
      local blink = require("blink.cmp")
      blink.setup({
        snippets = { preset = "luasnip" },
        signature = { enabled = true },
        appearance = {
          use_nvim_cmp_as_default = true,
          nerd_font_variant = "normal",
        },
        sources = {
          default = { "lsp", "path", "buffer", "snippets" },
          providers = {
            lsp = { min_keyword_length = 1 },
            path = { min_keyword_length = 2 },
            buffer = { min_keyword_length = 2 },
            snippets = {
              name = "LuaSnip",
              module = "blink.cmp.sources.snippets",
              score_offset = 100,
              min_keyword_length = 2,
            },
          },
        },
        keymap = {
          ["<CR>"] = { "accept", "fallback" },
          ["<Tab>"] = { "select_next", "fallback" },
          ["<S-Tab>"] = { "select_prev", "fallback" },
          ["<M-Space>"] = { "show", "fallback" }, -- match your old mapping
        },
        cmdline = { enabled = false },
        completion = {
          menu = {
            scrolloff = 1,
            scrollbar = false,
            draw = {
              columns = {
                { "kind_icon" },
                { "label", "label_description", gap = 1 },
                { "kind" },
                { "source_name" },
              },
            },
          },
          documentation = {
            window = {
              scrollbar = false,
              winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
            },
            auto_show = true,
            auto_show_delay_ms = 200,
          },
        },
      })

      -- Load snippets
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
