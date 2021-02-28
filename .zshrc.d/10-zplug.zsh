#!/usr/bin/env zsh
ZPLUG_HOME="${ZDOTDIR:-$HOME}/.zplug"
ZPLUG_LOADFILE="${ZDOTDIR:-$HOME}/.zplugrc"

[[ -d "$ZPLUG_HOME" ]] || {
  git clone --quiet https://github.com/zplug/zplug.git "$ZPLUG_HOME"

  # Fix for long-waited first loading, remove it when merged upstream
  git -C "$ZPLUG_HOME" apply <(curl -s https://github.com/crhg/zplug/commit/5632b8ad22dbcaa4b6ea485bb852684125157f5f.patch)
}

source "$ZPLUG_HOME/init.zsh"

if ! zplug check; then
    LC_ALL="en_US.UTF-8" zplug install
fi

LC_ALL="en_US.UTF-8" zplug load
