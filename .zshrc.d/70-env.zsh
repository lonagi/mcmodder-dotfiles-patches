[[ -e "$HOME/.profile" ]] && source "$HOME/.profile"

export EDITOR="${EDITOR:-nano}"
export PAGER="${PAGER:-less}"

PATH="${ZDOTDIR:-$HOME}/bin:$PATH"
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

#disable pacman package compressing
PKGEXT='.pkg.tar'
