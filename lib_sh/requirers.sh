#!/usr/bin/env zsh

###
# convienience methods for requiring installed software
# @author Adam Eivy
###

function require_apm() {
    running "checking atom plugin: $1"
    apm list --installed --bare | grep $1@ > /dev/null
    if [[ $? != 0 ]]; then
        action "apm install $1"
        apm install $1
    fi
    ok
}

function require_gem() {
    running "gem $1"
    if [[ $(gem list --local | grep $1 | head -1 | cut -d' ' -f1) != $1 ]]; then
        action "gem install $1"
        gem install $1
    fi
    ok
}

function require_mas() {
    running "mas $1"
    if [[ $(mas list | grep $1 | head -1 | cut -d' ' -f1) != $1 ]]; then
        action "mas install $1"
        mas install $1
    fi
    ok
}

function require_node(){
    running "node -v"
    node -v
    if [[ $? != 0 ]]; then
        action "node not found, installing via homebrew"
        brew install node
    fi
    ok
}

function require_npm() {
    sourceNVM
    nvm use node
    running "npm $*"
    npm list -g --depth 0 | grep $1@ > /dev/null
    if [[ $? != 0 ]]; then
        action "npm install -g $*"
        npm install -g $@
    fi
    ok
}

function require_yarn() {
    sourceNVM
    nvm use node
    running "yarn add global $*"
    yarn list -g --depth 0 | grep $1@ > /dev/null
    if [[ $? != 0 ]]; then
        action "yarn add global $*"
        yarn add global $@
    fi
    ok
}


function require_pip() {
    running "pip install $*"
    python3 list -g --depth 0 | grep $1@ > /dev/null
    if [[ $? != 0 ]]; then
        action "python3 -m pip install $*"
        python3 -m pip install $@
    fi
    ok
}

function sourceNVM(){
    export NVM_DIR=~/.nvm
    source $(brew --prefix nvm)/nvm.sh
}

function require_nvm() {
    mkdir -p ~/.nvm
    cp $(brew --prefix nvm)/nvm-exec ~/.nvm/
    sourceNVM
    nvm install $1
    if [[ $? != 0 ]]; then
        action "installing nvm"
        require_brew nvm
        . ~/.bashrc
        nvm install $1
    fi
    ok
}