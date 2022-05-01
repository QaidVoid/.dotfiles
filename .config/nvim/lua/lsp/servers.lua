M = {}

local lspconfig = require"lspconfig"
local utils = require"lsp.utils"

local servers = {
  bashls = {
    cmd = {"bash-language-server", "start"}
  },
  clangd = {},
  cssls = {
    cmd = {"vscode-css-language-server", "--stdio"}
  },
  gopls = {
    cmd = {"gopls"}
  },
  graphql = {
    cmd = {"graphql-lsp", "server", "-m", "stream"}
  },
  html = {
    cmd = {"vscode-html-language-server", "--stdio"}
  },
  jdtls = {},
  jsonls = {
    cmd = {"vscode-json-language-server", "--stdio"}
  },
  rnix = {},
  pyright = {
    cmd = {"pyright-langserver", "--stdio"}
  },
  solang = {
    cmd = {"solang", "--language-server", "--target", "ewasm"}
  },
  sqls = {
    cmd = {"sqls"}
  },
  sumneko_lua = {
    cmd = {vim.env.HOME .. "/.local/bin/lua/bin/lua-language-server"}
  },
  taplo = {
    cmd = {"taplo-lsp", "run"}
  },
  tsserver = {
    cmd = {"typescript-language-server", "--stdio"}
  }
}

M.setup = function()
  for server, config in pairs(servers) do
    if type(config) == 'function' then
      config = config()
    end
    config.flags = {
      debounce_text_changes = 150,
    }
    config.on_attach = utils.on_attach
    config.capabilities = vim.tbl_extend('keep', config.capabilities or {}, utils.capabilities)
    lspconfig[server].setup(config)
  end
end

return M
