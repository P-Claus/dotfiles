local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")

-- Source stdheader.vim file
vim.cmd("source ~/.config/nvim/stdheader.vim")

-- Function to check if c-formatter-42 is installed
local function is_c_formatter_42_installed()
  local handle = io.popen('pip3 show c-formatter-42')
  local result = handle:read("*a")
  handle:close()
  return result ~= ''
end

if not is_c_formatter_42_installed() then
  print("Installing c_formatter_42")
  os.execute('pip3 install --user c-formatter-42')
end

-- Set the filetype for Dockerfiles
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "Dockerfile", "*.dockerfile", "*.Dockerfile" },
    callback = function()
        vim.bo.filetype = "dockerfile"
    end,
})
