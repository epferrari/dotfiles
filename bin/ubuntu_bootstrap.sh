# The Basics
sudo apt-get install xsel curl build-essential git software-properties-common

# RVM
\curl -sSL https://get.rvm.io | bash -s stable --ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
gem install rake

# Install NVM
sudo apt-get install libssl-dev
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
export NVM_DIR="/home/kurt/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Install NPM
nvm install stable
npm install -g typescript gulp-cli

# YouCompleteMe deps
sudo apt-get install cmake python-dev python3-dev

# Neovim
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
gem install neovim
sudo apt-get install python-pip python-dev build-essential
pip install --upgrade neovim
