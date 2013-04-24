require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  initialize_submodules
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README.rdoc LICENSE].include? file

    if File.exist?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
        puts "identical ~/.#{file.sub('.erb', '')}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub('.erb', '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub('.erb', '')}"
        end
      end
    else
      link_file(file)
    end
  end

  setup_vundle
end

desc "install dotfiles without any prompts, assuming overwrite"
task :promptless_install do
  initialize_submodules
  $promptless = true

  Dir['*'].each do |file|
    next if %w[Rakefile README.rdoc LICENSE].include? file

    if File.exist?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
        puts "identical ~/.#{file.sub('.erb', '')}"
      else
        replace_file(file)
      end
    else
      link_file(file)
    end
  end

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
