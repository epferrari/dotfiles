require 'rake'
require 'erb'
require 'digest/md5'

PLATFORM_IS_OSX = (Object::RUBY_PLATFORM =~ /darwin/i) ? true : false

desc "install the dot files into user's home directory"
task :install do
  initialize_submodules

  create_local_files
  link_files(Dir.pwd, ENV['HOME'], :prefix => '.')

  system('bin/install_powerline_fonts.sh')

  setup_vim_plugins
end

desc "install dotfiles without any prompts, assuming overwrite"
task :promptless_install do
  initialize_submodules
  $promptless = true

  create_local_files
  link_files(Dir.pwd, ENV['HOME'], :prefix => '.', :replace_all => true)

  setup_vim_plugins
end

def create_local_files
  system('touch ~/.vimrc.local')
  system('touch ~/.gvimrc.local')
end

def setup_vim_plugins
  if File.exists?('vim/bundle/vimproc.vim/Makefile') && !File.exists?('vim/bundle/vimproc.vim/lib/vimproc_mac.so')
    puts 'Building vimproc'
    system('cd vim/bundle/vimproc.vim && make')
  end

  if File.exists?('vim/bundle/YouCompleteMe') && !File.exists?('vim/bundle/YouCompleteMe/doc/tags') && which('python')
    puts 'Setting up YouCompleteMe'
    system('cd vim/bundle/YouCompleteMe/ && ./install.py --tern-completer')
  end
end

def link_files(source_dir, destination_dir, opts)
  prefix = opts[:prefix] || ''
  replace_all = opts[:replace_all] || false
  copy_file = opts[:copy_file] || false

  files = Dir.chdir(source_dir) do
    Dir.glob('*')
  end

  files.each do |filename|
    next if %w[Rakefile README.md LICENSE].include? filename

    source_file = File.join(source_dir, filename)
    destination_file = File.join(destination_dir, "#{prefix}#{filename.sub('.erb', '')}")

    if File.exist?(destination_file)
      if File.identical? source_file, destination_file
        puts "identical #{destination_file}"
      elsif copy_file && file_hash(source_file) == file_hash(destination_file)
        puts "identical #{destination_file}"
      elsif replace_all
        replace_file(source_file, destination_file, copy_file)
      else
        print "overwrite #{destination_file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(source_file, destination_file, copy_file)
        when 'y'
          replace_file(source_file, destination_file, copy_file)
        when 'q'
          exit
        else
          puts "skipping #{destination_file}"
        end
      end
    elsif copy_file
      replace_file(source_file, destination_file, copy_file)
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

def replace_file(source, destination, copy = false)
  system %Q{rm -rf "#{destination}"}
  if copy
    puts "writing #{destination}"
    system %Q{cp "#{source}" "#{destination}"}
  else
    link_file(source, destination)
  end
end

def initialize_submodules
  system %Q{git submodule update --init --recursive && git submodule status}
end

def file_hash(filename)
  Digest::MD5.hexdigest(IO.read(filename))
end

def which(cmd)
  exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
  ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
    exts.each { |ext|
      exe = File.join(path, "#{cmd}#{ext}")
      return exe if File.executable?(exe) && !File.directory?(exe)
    }
  end
  return nil
end
