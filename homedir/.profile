#############################################################
# Generic configuration that applies to all shells
#############################################################
eval "$(/usr/local/bin/brew shellenv)"

source ~/.shellvars
source ~/.shellfn
source ~/.shellpaths
source ~/.shellaliases
# Private/Proprietary shell aliases (not to be checked into the public repo) :)
source ~/Dropbox/dev/.profile


#export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config:$HOME/.kube/configs/humpback.yaml
