vim.g.vimwiki_list = {
  {
    path = '~/Dropbox/vimwiki/',
    syntax = 'markdown',
    ext = '.md',
  },
}

vim.g.vimwiki_ext2syntax = {
  ['.md'] = 'markdown',
  ['.markdown'] = 'markdown',
  ['.mdown'] = 'markdown',
}

local function get_last_folder_name(path)
  -- Normalize the path by removing a trailing slash if it exists
  path = string.gsub(path, '/$', '')

  -- Capture the last folder name after the last slash
  local name = string.match(path, ".*/(.*)")
  return name
end


local function ask_for_permission(question)
  local answer = vim.fn.confirm(question, "&Yes\n&No", 2)
  if answer == 1 then
    print("User gave permission.")
    return true
  else
    print("User denied permission.")
    return false
  end
end

function Open_or_create_wiki_index()
  local cwd = vim.fn.getcwd()
  local project_name = get_last_folder_name(cwd)
  local wiki_path = cwd .. "/wiki"
  local index_file = wiki_path .. "/index.md"

  -- Check if the wiki directory exists, create it if not
  if vim.fn.isdirectory(wiki_path) == 0 then
    if ask_for_permission("Create wiki directory?") then
      os.execute("mkdir -p " .. wiki_path)
      -- Check if the index.md file exists, open or create it
      if vim.fn.filereadable(index_file) == 0 then
        -- If file does not exist, create it and add initial content
        local file = io.open(index_file, "w")

        if file then
          -- Ask if to use parent folder name as project name
          if not ask_for_permission("The project name is " .. project_name .. "?") then
            project_name = vim.fn.input("Enter project name: ")
          end

          project_name = string.gsub(project_name, ' ', '-')

          file:write("# " ..
          project_name ..
          " || project:" ..
          project_name ..
          "\n\n## Notes\n\n## TODO | status:pending -bug\n\n## Bugs | status:pending +bug\n\n## Archive | status:Completed")
          file:close()
        end
      end
    end
  end

  if vim.fn.filereadable(index_file) == 1 then
    vim.api.nvim_command("edit " .. index_file)
  end
end

-- Create command to update vimwiki list with project wikis
vim.keymap.set("n", "<Leader>wp", ":lua Open_or_create_wiki_index()<CR>", { noremap = true })
