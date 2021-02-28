#!/usr/bin/env zsh

function __kk::title {
  emulate -L zsh
  setopt prompt_subst

  [[ "$EMACS" == *term* ]] && return

  : ${2=$1}

  case "$TERM" in
    cygwin|xterm*|putty*|rxvt*|ansi)
      print -Pn "\e]2;$2:q\a"
      print -Pn "\e]1;$1:q\a"
      ;;
    screen*)
      print -Pn "\ek$1:q\e\\"
      ;;
    *)
      if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
        print -Pn "\e]2;$2:q\a"
        print -Pn "\e]1;$1:q\a"
      elif [[ -n "$terminfo[fsl]" ]] && [[ -n "$terminfo[tsl]" ]]; then
        echoti tsl
        print -Pn "$1"
        echoti fsl
      fi
      ;;
  esac
}

__KK_TAB_TITLE_IDLE="%15<..<%~%<<"
__KK_TAB_TITLE='$CMD'
__KK_TITLE='%100>...>$LINE%<<'

if [[ "$TERM_PROGRAM" == Apple_Terminal ]]; then
  __KK_TITLE_IDLE="%n@%m"
elif [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  __KK_TITLE_IDLE="%n@%m: %~"
else
  __KK_TITLE_IDLE="%~"
fi

function __kk::title::precmd {
  emulate -L zsh

  __kk::title $__KK_TAB_TITLE_IDLE $__KK_TITLE_IDLE
}

# Runs before executing the command
function __kk::title::preexec {
  emulate -L zsh
  setopt extended_glob

  # cmd name only, or if this is sudo or ssh, the next cmd
  local CMD=${1[(wr)^(*=*|sudo|ssh|mosh|rake|-*)]:gs/%/%%}
  local LINE="${2:gs/%/%%}"

  __kk::title $__KK_TAB_TITLE $__KK_TITLE
}

precmd_functions+=(__kk::title::precmd)
preexec_functions+=(__kk::title::preexec)

