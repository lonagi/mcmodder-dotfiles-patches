function cdtemp {
    cd $(mktemp -d)
}
alias t=cdtemp

function nh {
    xdg-open .
}

function nb {
    xdg-open ./build/libs/
}

function nt {
    xdg-open "$(mktemp -d)"
}

alias dns='resolvectl query'
alias mkdir='mkdir -p'

function mkcdir {
    mkdir -p "$1"
    cd "$1"
}
