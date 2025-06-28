local function find_tags_files()
  local uv = vim.loop
  local path = uv.cwd()
  local tags_files = {}

  local function check_dir(dir)
    local tags_path = dir .. "/tags"
    local stat = uv.fs_stat(tags_path)
    if stat and stat.type == "file" then
      table.insert(tags_files, tags_path)
    end
  end

  while true do
    check_dir(path)
    local parent = uv.fs_realpath(path .. "/..")
    if not parent or parent == path then
      break
    end
    path = parent
  end

  return tags_files
end

local tags = find_tags_files()
if #tags > 0 then
  vim.opt.tags = table.concat(tags, ",")  -- set tags option, replace any previous value
else
  vim.opt.tags = ""  -- clear tags if none found
end

-- Gutentags configuration
vim.g.gutentags_enabled = 1
vim.g.gutentags_modules = { 'ctags' }

vim.g.gutentags_file_list_command = {
  ['default'] = 'find . -type f \\( -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.v" -o -name "*.sv" -o -name "*.lua" -o -name "*.vim" \\)'
}

vim.g.gutentags_ctags_extra_args = {
  '--tag-relative=no',
  '--fields=+l',
}
