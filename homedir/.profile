#############################################################
# Generic configuration that applies to all shells
#############################################################
eval "$(/opt/homebrew/bin/brew shellenv)"

source ~/.shellvars
source ~/.shellfn
source ~/.shellpaths
source ~/.shellaliases
# Private/Proprietary shell aliases (not to be checked into the public repo) :)
source ~/Dropbox/.shellaliases

#export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config:$HOME/.kube/configs/humpback.yaml
