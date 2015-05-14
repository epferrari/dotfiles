#!/bin/bash

# Only install fonts if in a Linux Windows Manager or MacOS
if [[ (-z "$GDMSESSION") || (-z "$DESKTOP_SESSION") || (`uname` == "Darwin") ]]; then

  powerline_install_dir="$( cd "$( dirname "$0" )" && pwd )"
  powerline_dir="$powerline_install_dir/repos"

  # Download fonts
  git clone https://github.com/Lokaltog/powerline-fonts.git $powerline_dir
  cd $powerline_dir && git pull origin master

  # Install fonts
  $powerline_dir/install.sh
fi
