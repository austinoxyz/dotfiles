function AddToPath(dir)
  local cwd = vim.fn.getcwd()
  vim.opt.path:append(','..cwd..'/'..dir)
end

function LoadPathFile(filename)
  filename = filename or '.nvim_path'
  local f = io.open(filename, 'r')
  if not f then return end
  for dir in f:lines() do
    AddToPath(dir)
  end
  f:close()
end

LoadPathFile()
