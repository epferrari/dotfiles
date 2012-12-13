# Kurt Preston Dot Files

Provides an organized, version controlled, portable system configuration for *nix systems (including MacOS).  Notably, in includes shell customizations and aliases, custom VI commands and plugins, and the oh-my-zsh project.

## Installation

	git clone git://github.com/KurtPreston/dotfiles
	cd dotfiles
	rake install

**Note:** if you already have some commands in .bashrc or .bash_profile you would like to keep, just place them in the file **~/.localrc**.

## Theme and Plugin Selection
To set a theme, set the name to the ZSH_THEME environment variable in the ~/.localrc file.  For example, add the following line:

    ZSH_THEME="robbyrussell"

The Dot Files enable many plugins by default, but to enable additional oh-my-zsh plugins, list them in the plugins environment variable in ~/.localrc.  For example:
    plugins=(django osx)

## Bash Aliases

### General

	autoformat [filename]
		Removes whitespace and standardizes spacing
		ex: autoformat *.rb

	autoformatall
		Will autoformat all compatible files within a directory

	replace [files] [find text] [replace text]
		Performs a find/replace across multiple files
		ex: replace "*.erb" "<b>" "<strong>"

	reload
		Reload all bash files

	h [file in the home directory]
		Jump to a folder in the home directory with tab completion
		ex: h Mu[tab] -> h Music

	c [file in the ~/code directory]
		Jump to a folder in the ~/code directory with tab completion
		This is helpful if you store all programming projects in ~/code
		ex: c do[tab] -> c dotfiles

### Git

Git gets tab completion, colored branch data at the prompt, as well as the following commands.

	gco -or- git co
		git checkout
	gs -or- git st
		git status
	gb -or- git br
		git branch
	ga
		git add

	git rb [remote branch name]
		checkout and track a remote branch
	git lg
		Detailed log view, including authors and branch history

	brclean
		Remove all *local* branches that have been merged
	rbrclean
		Remove all *remote* branches that have been merged
	gbc -or- gbclean
		Remove all *local and remote* merged branches
	gba -or- git-branch-authors
		List the authors of all git branches
	git autoformat
		Installs a git hook to autoformat all files during commit
		Note: This feature is still experimental

### Rails

	log
		tail the development log
	tlog
		tail the test log
	rs
		rails server
	rc
		rails console
	rg
		rails generate
	rst
		restart server (touch tmp/restart.txt)

## VI Aliases

Note: many of the VI commands will require the installation of **gvim** on Linux machines, or **mvim** on MacOS machines.

	\ff
		Open Fuzzy Finder, an excellent way to quickly open files
	\nt
		Open Nerd Tree, a tree-style directory browser
	\be
		Open Buffer Explorer, a list of recently opened files
	\cc
		Comment lines
	\uc
		Uncomment lines
	\ws
		Remove all trailing whitespace from file
	\nh
		Stop highlighting words (after a find operation)
	\fl
		Format a line into multiple lines
		ex: some_method_call(param1, param2, param3)
		    \fl
		    some_method_call(
		    	param1,
		    	param2,
		    	param3)
	:A
		Switch between test files and implementation file
	ctrl+p
		Autocomplete
	ctrl+x, ctrl-c, ctrl-v
		Cut, copy, and paste now work in Linux VI

## Credits

This project is a fork of Ryan Bates' dotfiles, integrates oh-my-zsh, and borrows significantly from Drew Olson's vim_dotfiles, in addition to dozens of other sources.
