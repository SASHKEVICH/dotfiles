-- UI options
vim.cmd("set nocompatible")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set cursorline")

-- Indentation options
vim.cmd("set autoindent")
-- vim.cmd("set noexpandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=-1")
vim.cmd("set smartindent")
vim.cmd("filetype plugin indent on")
vim.cmd("set shiftwidth=0")

-- Search options
vim.cmd("set hlsearch")
vim.cmd("set incsearch")
vim.cmd("set smartcase")

-- Text Rendering options
vim.cmd("set encoding=utf-8")
vim.cmd("set linebreak")
vim.cmd("set wrap")

-- Other options
vim.cmd("set nobackup")
vim.cmd("set cmdheight=0")
vim.g.mapleader = " "

vim.g.editorconfig = true
