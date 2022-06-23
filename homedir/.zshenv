fpath=($fpath $HOME/.zsh/func)
typeset -U fpath

export NVM_LAZY=1
#export NVM_AUTOLOAD=1
export NVM_LAZY_CMD=(pnpm, node, yarn, npm)