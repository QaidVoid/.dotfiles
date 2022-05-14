local ok, indent_blankline = pcall(require, "indent_blankline")
if not ok then
  return
end

vim.cmd[[highlight IndentBlanklineContextChar guifg=#5a5a5a gui=nocombine]]

require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
}
