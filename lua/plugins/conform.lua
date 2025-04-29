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

local function init()
  local function get_level(args)
    return args.bang and 'g' or 'b'
  end
  local function notify(args)
    local level = get_level(args)
    require('notify').notify(
      string.format(
        'Auto formatting %s %s',
        vim[level].disable_autoformat and 'enabled' or 'disabled',
        level == 'b' and string.format('for buffer id: %s', vim.api.nvim_get_current_buf()) or 'globally'
      ),
      vim.log.levels.INFO,
      ---@diagnostic disable-next-line: missing-fields
      {
        title = 'conform.nvim formatting',
      }
    )
  end
end

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  opts = opts,
  cmd = { 'ConformInfo' },
  keys = {},
  init = init,
}
