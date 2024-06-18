local function npm_root()
  local handle = io.popen("npm root")

  if handle == nil then
    error("Failed to open command: npm root")
  end

  local result = handle:read("*a")
  handle:close()

  return string.gsub(result, "%s*$", "")
end

local function npm_root_g()
  local handle = io.popen("npm root -g")

  if handle == nil then
    error("Failed to open command: npm root -g")
  end

  local result = handle:read("*a")
  handle:close()

  return string.gsub(result, "%s*$", "")
end

local function npm_which(lib)
  local path = npm_root() .. '/' .. lib
  return vim.loop.fs_stat(path) and path or (npm_root_g() .. '/' .. lib)
end

return {
  root   = npm_root,
  root_g = npm_root_g,
  which  = npm_which,
}
