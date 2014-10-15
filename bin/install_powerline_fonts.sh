#!/bin/bash

# Configure Directories
powerline_dir="/tmp/powerline-fonts"

if [[ `uname` == 'Darwin' ]]; then
  # MacOS
  font_dir="$HOME/Library/Fonts"
else
  # Linux
  font_dir="$HOME/.fonts"
  mkdir -p $font_dir
fi

# Download fonts
git clone https://github.com/Lokaltog/powerline-fonts.git $powerline_dir

# Copy all fonts to user fonts directory
find_command="find $powerline_dir -name '*.[o,t]tf' -type f -print0"
eval $find_command | xargs -0 -I % cp % $font_dir/

# Reset font cache on Linux
if [[ -n `which fc-cache` ]]; then
  fc-cache -f ~/.fonts/
fi

rm -rf $powerline_dir
echo "All Powerline fonts installed to $font_dir"
