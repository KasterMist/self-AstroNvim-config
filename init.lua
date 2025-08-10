-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  local result = vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
  if vim.v.shell_error ~= 0 then
    -- stylua: ignore
    vim.api.nvim_echo({ { ("Error cloning lazy.nvim:\n%s\n"):format(result), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
    vim.fn.getchar()
    vim.cmd.quit()
  end
end

vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.number = true -- 显示行号
vim.wo.cursorline = true -- 高亮当前行
-- Display tabs and trailing spaces
vim.opt.list = true -- 显示不可见字符
-- vim.opt.listchars = { tab = ">-", trail = "-" } -- 设置制表符和尾随空格的显示字符
vim.opt.ignorecase = true -- 搜索时忽略大小写
vim.opt.smartcase = true -- 智能大小写匹配
vim.opt.hlsearch = true -- 高亮搜索结果

vim.opt.scrolloff = 5 -- 光标距离屏幕顶部/底部的行数
vim.opt.sidescrolloff = 10 -- 光标距离屏幕左右边缘的字符数
vim.opt.startofline = false -- 光标保持在当前列位置

vim.opt.conceallevel = 2 -- 隐藏字符的显示级别

vim.o.signcolumn = "yes:1" -- 显示符号列

vim.wo.wrap = false -- 禁用自动换行

-- Tab related options
vim.opt.softtabstop = 4 -- 软制表符宽度
vim.opt.shiftwidth = 4 -- 缩进宽度
vim.opt.expandtab = true -- 将制表符转换为空格
vim.opt.smartindent = true -- 智能缩进

vim.opt.splitbelow = true -- 新窗口在下方打开
vim.opt.splitright = true -- 新窗口在右侧打开

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " " -- 设置全局leader键为空格
vim.g.maplocalleader = "\\" -- 设置本地leader键为反斜杠


require "lazy_setup"
require "polish"
require "keymapping"
