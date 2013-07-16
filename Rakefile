require 'rake'
require 'erb'

PLATFORM_IS_OSX = (Object::RUBY_PLATFORM =~ /darwin/i) ? true : false


desc "install the dot files into user's home directory"
task :install do
  initialize_submodules

  link_files(Dir.pwd, ENV['HOME'], '.', false)

  if PLATFORM_IS_OSX
    link_files("#{Dir.pwd}/fonts", "#{ENV['HOME']}/Library/Fonts", '', false)
  end

  setup_vundle
end

desc "install dotfiles without any prompts, assuming overwrite"
task :promptless_install do
  initialize_submodules
  $promptless = true

  link_files(Dir.pwd, ENV['HOME'], '.', true)

  setup_vundle
end

def setup_vundle
  # Set-up vundle and YouCompleteMe plugin
  system('vim +BundleInstall +qall')
  if File.exists?('vim/bundle/YouCompleteMe') && !File.exists?('vim/bundle/YouCompleteMe/doc/tags')
    system('cd vim/bundle/YouCompleteMe/ && ./install.sh')
  end
end

def link_files(source_dir, destination_dir, prefix = '.', replace_all = false)
  files = Dir.chdir(source_dir) do
    Dir.glob('*')
  end

  files.each do |filename|
    next if %w[Rakefile README.rdoc LICENSE].include? filename

    source_file = File.join(Dir.pwd, filename)
    destination_file = File.join(destination_dir, "#{prefix}#{filename.sub('.erb', '')}")

    if File.exist?(destination_file)
      if File.identical? source_file, destination_file
        puts "identical #{destination_file}"
      elsif replace_all
        replace_file(source_file, destination_file)
      else
        print "overwrite #{destination_file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(source_file, destination_file)
        when 'y'
          replace_file(source_file, destination_file)
        when 'q'
          exit
        else
          puts "skipping #{destination_file}"
        end
      end
    else
      link_file(source_file, destination_file)
    end
  end
end

def link_file(source, destination)
  if source =~ /.erb$/
    File.open(destination, 'w') do |new_file|
      new_file.write ERB.new(File.read(source)).result(binding)
    end
  else
    puts "linking #{destination}"
    system %Q{ln -s "#{source}" "#{destination}"}
  end
end

def replace_file(source, destination)
  system %Q{rm -rf "#{destination}"}
  link_file(source, destination)
end

def initialize_submodules
  system %Q{git submodule init && git submodule update && git submodule status}
end
