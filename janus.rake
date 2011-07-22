# add Freemarker syntax highlighting
vim_plugin_task "ftl" do
  sh "curl http://freemarker.sourceforge.net/download/editor/ftl.vim | sed 's|.$||' > syntax/ftl.vim"
  File.open(File.expand_path('../.vim/ftdetect/ftl.vim', __FILE__), 'w') do |file|
    file << "au BufNewFile,BufRead *.ftl        set ft=ftl"
  end
end

# add jQuery Template syntax highlighting
vim_plugin_task "vim-jquery-tmpl" do
  sh "curl https://raw.github.com/garbas/vim-jquery-tmpl/master/synx/jquerytmpl.vim > syntax/jquerytmpl.vim"
  sh "curl https://raw.github.com/garbas/vim-jquery-tmpl/master/ftdetect/jquerytmpl.vim > ftdetect/jquerytmpl.vim"
end

# use my experimental javascript snippets
vim_plugin_task "javascript-snippets" do
	sh "curl https://raw.github.com/thisgeek/snipmate-snippets/es5/snippets/javascript.snippets > snippets/javascript.snippets"
end
