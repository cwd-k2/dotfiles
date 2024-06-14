local ok, err = pcall(vim.cmd, [[
if &compatible
  set nocompatible
endif

runtime! basic/*.vim
]])

if not ok then
  print("Error while loading vim config script: " .. err)
end
