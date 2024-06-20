local function npm(args)
  local job = require('plenary.job'):new({
    command = "npm", args = args, enable_recording = true,
  })

  local stdout, code = job:sync()
  local stderr = job:stderr_result()

  if #stderr ~= 0 then
    require('notify')(table.concat(stderr, '\n'))
  end

  if code ~= 0 then
    local msg = '`npm ' .. table.concat(args, ' ') .. '\' failed with exit code: ' .. code
    error(debug.traceback(msg))
  end

  return table.concat(stdout, '\n')
end

local cache = {}

local function npm_root(cwd)
  cache[cwd] = cache[cwd] or npm({ "root" })
  return cache[cwd]
end

local function npm_root_g()
  cache.g = cache.g or npm({ "root", "-g" })
  return cache.g
end

local function npm_which(cwd, lib)
  local path = npm_root(cwd) .. '/' .. lib
  return vim.loop.fs_stat(path) and path or (npm_root_g() .. '/' .. lib)
end

return {
  root   = npm_root,
  root_g = npm_root_g,
  which  = npm_which,
}
