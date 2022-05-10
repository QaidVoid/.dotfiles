local ok, _ = pcall(require, "tokyonight")
if not ok then
  return
end

vim.g.tokyonight_style = "night"
vim.g.tokyonight_transparent = 1
vim.g.tokyonight_italic_functions = 1
vim.g.tokyonight_hide_inactive_statusline = 1
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.g.tokyonight_dark_float = 1
vim.g.tokyonight_dark_sidebar = 1

vim.cmd[[colorscheme tokyonight]]
