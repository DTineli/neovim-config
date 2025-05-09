local opts = {
  formatters_by_ft = {
    css = { 'prettier' },
    html = { 'prettier' },
    htmlangular = { 'prettier' },
    javascript = { 'eslin' },
    json = { 'prettier' },
    jsonc = { 'prettier' },
    lua = { 'stylua' },
    scss = { 'prettier' },
    typescript = { 'prettier' },
    vue = { 'prettier' },
    fish = { 'fish_indent' },
    sh = { 'shfmt', 'shellharden' },
    bash = { 'shfmt', 'shellharden' },
    markdown = { 'cbfmt', 'prettierd', 'markdownlint' },
    go = { 'goimports', 'gofmt' }, -- gofmt, gomodifytags
    templ = {
      'gofmt',
      'templ',
      'injected',
      'htmx-lsp',
    },
  },
  format_on_save = function(bufnr)
    local disabled = false -- require("neoconf").get("plugins.conform.disabled")
    ---@diagnostic disable-next-line: undefined-field
    if disabled or vim.b[bufnr].disable_autoformat or vim.g.disable_autoformat then
      return
    end
    return { timeout_ms = 500, lsp_fallback = true }
  end,
  notify_on_error = false,
  formatters = {
    shfmt = {
      prepend_args = { '-i', '2' },
    },
    shellharden = {
      prepend_args = { '--transform' },
    },
  },
}

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  opts = opts,
  cmd = { 'ConformInfo' },
  keys = {},
}
