local ok, tsconfig = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

tsconfig.setup {
  ensure_installed = "all",
  sync_install = false,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = { "css", "html" },
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = false,
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
}
