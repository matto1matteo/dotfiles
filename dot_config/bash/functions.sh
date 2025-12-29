cvim() {
    chezmoi edit $1 --apply
}

getBranch() {
    if [[ -d "$(pwd)/.git" ]]
    then
        echo "[$(git branch | sed -n '1{s/^* *//;p}')] "
    fi
}

lastdir() {
    var=($(echo $(pwd) | tr '/' '\n'))
    echo ${var[-1]}
}

tmup() {
    tmux new -s $(lastdir) -n editor nvim . \; neww -n term \; neww -n misc \; select-window -t editor
}

