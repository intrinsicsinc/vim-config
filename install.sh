#!/usr/bin/env bash
#
# DESCRIPTION
#   Updates ~/.vimrc with preferred color scheme and configuration. Note this
#   will overwrite your eisting ~/.vimrc file.

function install ()
{
    # Make directory to store color scheme
    # -p makes sub-directories as needed and does not error if directory
    # already exists
    mkdir -p $HOME/.vim/colors

    # Add color scheme
    echo "Copying solarized.vim to $HOME/.vim/colors..."
    cp solarized.vim $HOME/.vim/colors

    # Update vimrc
    echo "Updating $HOME/.vimrc..."
    cp vimrc $HOME/.vimrc

    echo "Installation succeeded."
}

# Ask for confirmation if .vimrc already exists
if [ -f "$HOME/.vimrc" ]; then
    echo "$HOME/.vimrc will be overwritten. Do you wish to continue?"
    select yn in "Yes" "No"; do
    case $yn in
	    Yes ) install; break;;
        No ) exit;;
    esac
    done
else
    install
fi
