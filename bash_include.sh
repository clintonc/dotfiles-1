mlc_git_list_untracked() {
    git status --porcelain --ignored | grep '^!!' | awk '{print $2}'
}

mlc_flush_dns() {
    dscacheutil -flushcache
    sudo killall -HUP mDNSResponder
}

alias emacs="emacs -nw"
export EDITOR="emacs -nw"
