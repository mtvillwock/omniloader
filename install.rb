#!/usr/bin/env ruby

puts "-------------------------------------------------------------------------"
puts "                             Begin OMNILOADER                            "
puts "-------------------------------------------------------------------------"

Dir.chdir
print "Making setup directory..."
Dir.mkdir("omniloader_setup") unless Dir.exists?("omniloader_setup")
print "done\n"

print "Copying .vimrc..."
vimrc_copy = File.exists?(".vimrc") ? File.read(".vimrc") : ""
Dir.chdir("omniloader_setup")
File.open("vimrc_copy", "w") do |f|
  f.puts vimrc_copy
end
Dir.chdir
print "done\n"

print "Copying .bashrc..."
bashrc_copy = File.exists?(".bashrc") ? File.read(".bashrc") : ""
Dir.chdir("omniloader_setup")
File.open("bashrc_copy", "w") do |f|
  f.puts bashrc_copy
end
Dir.chdir
print "done\n"

puts "Installing pathogen.vim..."
pathogen = system("mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -so ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim")
puts pathogen ? "done" : "failed"

puts "Installing NERDTree..."
nerd = system("git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree.vim")
puts nerd ? "done" : "failed"

puts "Installing ctrlp.vim..."
ctrlp = system("git clone https://github.com/kien/ctrlp.vim ~/.vim/bundle/ctrlp.vim")
puts ctrlp ? "done" : "failed"

puts "Installing Rainbow Parentheses..."
rain = system("git clone https://github.com/kien/rainbow_parentheses.vim ~/.vim/bundle/rainbow_parentheses.vim")
puts rain ? "done" : "failed"

puts "Installing Fugitive..."
fugitive = system("git clone https://github.com/tpope/vim-fugitive ~/.vim/bundle/vim-fugitive")
puts fugitive ? "done" : "failed"

puts "Installing Indent Guides..."
indent = system("git clone https://github.com/nathanaelkane/vim-indent-guides ~/.vim/bundle/vim-indent-guides")
puts indent ? "done" : "failed"

puts "Installing rails.vim..."
vimrails = system(
  "cd ~/.vim/bundle" &&
  "git clone git://github.com/tpope/vim-rails.git" &&
  "git clone git://github.com/tpope/vim-bundler.ger"
)
puts vimrails ? "done" : "failed"

vimrails = system("git clone git://github.com/tpope/vim-rails.git")
vimrails = system("git clone git://github.com/tpope/vim-bundler.git")

print "Applying your .vimrc..."
vimrc_master = `curl https://raw.github.com/Supernats/omniloader/master/master_settings/.vimrc`
Dir.chdir
File.open("vimrc", "w") do |f|
  f.puts vimrc_master
end
`mv vimrc .vimrc`
print "done\n"

print "Applying your .bashrc..."
bashrc_master = `curl https://raw.github.com/Supernats/omniloader/master/master_settings/.bashrc`
Dir.chdir
File.open(".bashrc", "w") do |f|
  f.puts bashrc_master
end
print "done\n"

puts "-------------------------------------------------------------------------"
puts "                              End OMNILOADER                             "
puts "-------------------------------------------------------------------------"
puts "ENJOY YOUR AWESOME TERMINAL"
