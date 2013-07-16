require 'rake'
require 'erb'

PLATFORM_IS_OSX = (Object::RUBY_PLATFORM =~ /darwin/i) ? true : false


desc "install the dot files into user's home directory"
task :install do
  initialize_submodules

  link_files(Dir['*'], ENV['HOME'], '.', false)

  if PLATFORM_IS_OSX
    #link_files(Dir['fonts', '*'], "#{ENV['HOME']}/Library/Fonts", '', false)
  end

  setup_vundle
end

desc "install dotfiles without any prompts, assuming overwrite"
task :promptless_install do
  initialize_submodules
  $promptless = true

  link_files(Dir['*'], ENV['HOME'], '.', true)

  setup_vundle
end

def setup_vundle
  # Set-up vundle and YouCompleteMe plugin
  system('vim +BundleInstall +qall')
  if File.exists?('vim/bundle/YouCompleteMe') && !File.exists?('vim/bundle/YouCompleteMe/doc/tags')
    system('cd vim/bundle/YouCompleteMe/ && ./install.sh')
  end
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub('.erb', '')}"}
  link_file(file)
end

def link_files(files, destination, prefix = '.', replace_all = false)
  files.each do |file|
    next if %w[Rakefile README.rdoc LICENSE].include? file

    filename = File.join(destination, ".#{file.sub('.erb', '')}")

    if File.exist?(filename)
      if File.identical? file, filename
        puts "identical #{filename}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite #{filename}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping #{filename}"
        end
      end
    else
      link_file(file)
    end
  end
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end

def initialize_submodules
  system %Q{git submodule init && git submodule update && git submodule status}
end
