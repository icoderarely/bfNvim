return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      local lsp_format_opt = disable_filetypes[vim.bo[bufnr].filetype] and "never" or "fallback"
      return {
        timeout_ms = 500,
        lsp_format = lsp_format_opt,
      }
    end,
    formatters = {
      prettier = {
        prepend_args = function()
          return {
            "--single-quote",
            "--no-bracket-spacing",
            "--print-width", "80",
            "--tab-width", "2",
            "--config-precedence", "prefer-file",
          }
        end,
      },
    },
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      html = { "prettierd", "prettier", stop_after_first = true },
      json = { "prettier" },
      yaml = { "prettier" },
      toml = { "prettier" },
      go = { "gofumpt", "goimports", lsp_format = "fallback" },
      rust = { "rustfmt", lsp_format = "fallback" },
      python = { "black", "isort", lsp_format = "fallback" },
    },
  },
}
