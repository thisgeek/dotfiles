# add Freemarker syntax highlighting
vim_plugin_task "ftl" do
  sh "curl http://freemarker.sourceforge.net/download/editor/ftl.vim > syntax/ftl.vim"
  File.open(File.expand_path('../.vim/ftdetect/ftl.vim', __FILE__), 'w') do |file|
    file << "au BufNewFile,BufRead *.ftl        set ft=ftl"
  end
end

# add jsbeautify
vim_plugin_task "jsbeautify" do
  sh "curl http://www.vim.org/scripts/download_script.php?src_id=11120 > plugin/jsbeautify.vim"
end

# use my experimental javascript snippets
vim_plugin_task "javascript-snippets" do
  sh "curl https://raw.github.com/thisgeek/snipmate-snippets/es5/snippets/javascript.snippets > snippets/javascript.snippets"
end
