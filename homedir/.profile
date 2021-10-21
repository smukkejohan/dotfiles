#############################################################
# Generic configuration that applies to all shells
#############################################################

source ~/.shellvars
source ~/.shellfn
source ~/.shellpaths
source ~/.shellaliases
source ~/.iterm2_shell_integration.`basename $SHELL`
# Private/Proprietary shell aliases (not to be checked into the public repo) :)
source ~/Dropbox/.shellaliases
# source ~/.extra

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

export NVM_LAZY=1
export NVM_AUTOLOAD=1
export NVM_LAZY_CMD=(yarn npm pnpm)
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

#export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config:$HOME/.kube/configs/humpback.yaml
