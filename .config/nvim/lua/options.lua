local options = {
  backup = false, -- backup file
  clipboard = "unnamedplus", -- access system clipboard
  cmdheight = 1, -- height of the command line
  completeopt = "menuone,noselect", -- options for completion
  conceallevel = 0, -- level of concealing
  cursorline = true, -- highlight current line
  expandtab = true, -- expand tab to spaces
  ignorecase = true, -- ignore case in search
  mouse = "a", -- use mouse
  number = true, -- display line numbers
  pumheight = 10, -- height of the popup menu
  relativenumber = true, -- display line numbers relative to the current line
  scrolloff = 8, -- scroll offset
  shiftround = true, -- round value when shifting
  shiftwidth = 2, -- number of columns to shift
  sidescrolloff = 8, -- side scroll offset
  showmode = false, -- show mode
  showtabline = 2, -- show tabline
  signcolumn = "yes", -- show sign column
  smartcase = true, -- smart case
  smartindent = true, -- smart indent
  splitbelow = true, -- split window below
  splitright = true, -- split window right
  swapfile = false, -- swap file
  tabstop = 2, -- number of columns for a tab
  termguicolors = true, -- use terminal colors
  undofile = true, -- use undo file
  updatetime = 250, -- time interval for updating display
  writebackup = false, -- write backup file
  wrap = false, -- wrap lines
  shortmess = "filnxtToOFc", -- short messages
  iskeyword = "@,48-57,_,-,192-255", -- keywords
  laststatus = 3,
}

for k, v in pairs(options) do
  vim.o[k] = v
end
