HOME_PATH = ENV['HOME']
vim_list = FileList['vimrc*']

task :dispatch do 
    vim_list.each do |f|
      link_file(f)
    end
end

def bundle_install(user, package)
    unless File.exist? File.expand_path('~/.vim/bundle/#{package}')
    sh "git clone https://github.com/#{user}/#{package} ~/.vim/bundle/#{package}"
    end
end

task :vundle => [:dispatch] do |t|
    bundle_install 'gmarik', 'vundle'
    sh 'vim -c "BundleInstall" -c "-q" -c "q"'
end

def link_file(src)
    unless File.exist? File.expand_path("~/.#{src}")
    ln_s File.expand_path(src), File.expand_path("~/.#{src}")
    end
end

task :install => [:vundle]do
    link_file "zshrc"
    link_file "gitconfig"
end
