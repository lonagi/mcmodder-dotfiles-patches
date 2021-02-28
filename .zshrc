#!/usr/bin/env zsh

function _load_zsh() {
  local _file
  for _file in "$1"/*.zsh; do
    source "$_file"
  done
}

# Just lookup .zshrc.d dir for zsh files and load them
_load_zsh "${ZDOTDIR:-$HOME}/.zshrc.d"
