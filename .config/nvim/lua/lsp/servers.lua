M = {}

local lspconfig = require("lspconfig")
local utils = require("lsp.utils")

vim.g.markdown_fenced_languages = {
  "ts=typescript",
}

local root_pattern = lspconfig.util.root_pattern

local servers = {
  -- Bash language server
  bashls = {
    cmd = { "bash-language-server", "start" },
  },
  -- C/C++
  clangd = {},
  -- CSS
  cssls = {
    cmd = { "vscode-css-language-server", "--stdio" },
  },
  -- Deno
  denols = {
    cmd = { "deno", "lsp" },
    root_dir = root_pattern("deno.json"),
  },
  -- Go
  gopls = {
    cmd = { "gopls" },
  },
  -- GraphQL
  graphql = {
    cmd = { "graphql-lsp", "server", "-m", "stream" },
  },
  -- HTML
  html = {
    cmd = { "vscode-html-language-server", "--stdio" },
  },
  -- Java
  jdtls = {},
  -- JSON
  jsonls = {
    cmd = { "vscode-json-language-server", "--stdio" },
  },
  -- LaTeX
  texlab = {},
  -- Nix
  rnix = {},
  -- Python
  pyright = {
    cmd = { "pyright-langserver", "--stdio" },
  },
  -- Solidity
  solang = {
    cmd = { "solang", "--language-server", "--target", "ewasm" },
  },
  -- SQL
  sqls = {
    cmd = { "sqls" },
  },
  -- Lua
  sumneko_lua = {
    cmd = { os.getenv("HOME") .. "/.local/bin/lua/bin/lua-language-server" },
  },
  -- TOML
  taplo = {
    cmd = { "taplo-lsp", "run" },
  },
  -- TypeScript/JavaScript
  tsserver = {
    cmd = { "typescript-language-server", "--stdio" },
  },
}

M.setup = function()
  for server, config in pairs(servers) do
    if type(config) == "function" then
      config = config()
    end
    config.flags = {
      debounce_text_changes = 150,
    }
    config.on_attach = utils.on_attach
    config.capabilities = vim.tbl_extend("keep", config.capabilities or {}, utils.capabilities)
    lspconfig[server].setup(config)
  end
end

return M
