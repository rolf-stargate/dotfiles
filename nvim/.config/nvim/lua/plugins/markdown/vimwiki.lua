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

-- vim.g.vimwiki_global_ext = 0  -- don't treat all md files as vimwiki
