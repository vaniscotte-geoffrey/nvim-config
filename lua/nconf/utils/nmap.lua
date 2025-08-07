return function(keymap, remap, description, silent)
  if not silent then
    silent = false
  end
  local map = vim.keymap.set
  local opts = {
    desc = description,
    silent = silent
  }
  map("n", keymap, remap, opts)
end
