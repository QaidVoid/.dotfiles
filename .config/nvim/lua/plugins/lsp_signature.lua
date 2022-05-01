local ok, signature = pcall(require, "lsp_signature")
if not ok then
  return
end

local config = {
  debug = false,
  bind = true,
  hint_enable = true,
  hint_scheme = "Comment",
  handler_opts = { border = "rounded" },
  max_width = 80,
}

signature.setup(config)
