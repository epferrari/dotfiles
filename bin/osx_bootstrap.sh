# Install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install command line tools
brew install cmake wget
brew install nvm python
brew install neovim/neovim/neovim
pip install --upgrade neovim

# RVM
\curl -sSL https://get.rvm.io | bash -s stable
rvm install ruby --latest
gem install neovim

# NVM
brew install nvm
mkdir -p ~/.nvm
export NVM_DIR="/home/kurt/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/nvm.sh" ] && source "/usr/local/opt/nvm/nvm.sh"
nvm install node

# Get the dotfiles
mkdir ~/Code
cd ~/Code
git clone https://github.com/KurtPreston/dotfiles.git
cd dotfiles
rake install

# Install apps
brew cask install mattr-slate
brew cask install dropbox
brew cask install google-chrome
brew cask install dwihn0r-keepassx
brew cask install iterm2
brew cask install macvim
