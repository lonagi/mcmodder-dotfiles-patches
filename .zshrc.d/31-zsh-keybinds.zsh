## From OH-MY-ZSH https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/key-bindings.zsh

# check keybinds
[[ ! -n "${key[Up]}" ]] && key[Up]="${terminfo[kcuu1]:-^[[A}"
[[ ! -n "${key[Down]}" ]] && key[Down]="${terminfo[kcud1]:-^[[B}"
[[ ! -n "${key[Shift-Tab]}" ]] && key[Shift-Tab]="${terminfo[kcbt]:-^[[Z}"
[[ ! -n "${key[Control-Left]}" ]] && key[Control-Left]="${terminfo[kLFT5]:-^[[1;5D}"
[[ ! -n "${key[Control-Right]}" ]] && key[Control-Right]="${terminfo[kRIT5]:-^[[1;5C}"

# start typing + [Up-Arrow] - fuzzy find history forward
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey -- "${key[Up]}" up-line-or-beginning-search
# start typing + [Down-Arrow] - fuzzy find history backward
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey -- "${key[Down]}" down-line-or-beginning-search

# [Shift-Tab] - move through the completion menu backwards
bindkey -- "${key[Shift-Tab]}" reverse-menu-complete

# [Ctrl-RightArrow] - move forward one word
bindkey -- "${key[Control-Right]}" forward-word
# [Ctrl-LeftArrow] - move backward one word
bindkey -- "${key[Control-Left]}" backward-word
