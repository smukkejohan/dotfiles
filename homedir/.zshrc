# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh configuration.
export ZSH=~/.oh-my-zsh
export ZSH_THEME="powerlevel10k/powerlevel10k"
export DEFAULT_USER="$USER"

# Set to this to use case-sensitive completion
export CASE_SENSITIVE="true"

plugins=(colorize dirpersist autojump git cp asdf macos zsh-z)
source $ZSH/oh-my-zsh.sh


# Customize to your needs...
unsetopt correct

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

eval "$(asdf exec direnv hook zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh