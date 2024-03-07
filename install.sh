#!/usr/bin/env zsh

install_brew() {
    if ! command -v "brew" &> /dev/null; then
        printf "Homebrew not found, installing."
        # install homebrew
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        # set path
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    sudo softwareupdate --agree-to-license --install-rosetta

    printf "Installing homebrew packages..."
    brew bundle
}

create_dirs() {
    declare -a dirs=(
        "$HOME/dev"
    )

    for i in "${dirs[@]}"; do
        mkdir "$i"
    done
}

build_xcode() {
    if ! xcode-select --print-path &> /dev/null; then
        xcode-select --install &> /dev/null

        until xcode-select --print-path &> /dev/null; do
            sleep 5
        done

        sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer

        sudo xcodebuild -license
    fi
}

# include my library helpers for colorized echo and require_brew, etc
source ./lib_sh/echos.sh
source ./lib_sh/requirers.sh

printf "🗄 Creating directories\n"
create_dirs

printf "🛠 Installing Xcode Command Line Tools\n"
build_xcode

read "REPLY?Install homebrew packages[y|N]"
if [[ "$REPLY" =~ ^[Yy] ]];then
  printf "🍺 Installing Homebrew packages\n"
  install_brew
else
  ok "skipped";
fi

read "REPLY?Set macOS preferences [y|N]"
if [[ "$REPLY" =~ ^[Yy] ]];then
  printf "💻 Set macOS preferences\n"
  ./macos/settings
else
  ok "skipped";
fi

read "REPLY?Overwrite /etc/hosts with the hosts file from ./configs/hosts file) [y|N]"
if [[ "$REPLY" =~ ^[Yy] ]];then
    action "cp /etc/hosts /etc/hosts.backup"
    sudo cp /etc/hosts /etc/hosts.backup
    ok
    action "cp ./configs/hosts /etc/hosts"
    sudo cp ./configs/hosts /etc/hosts
    ok "Your /etc/hosts file has been updated. Last version is saved in /etc/hosts.backup"
else
    ok "skipped";
fi

git-lfs install

# install oh-my-zsh
#if [[ ! -d "${ZSH}" ]]; then
  rm -r "$ZSH"
  curl -L -s "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh" | sh
#fi

#if [[ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]]; then
  info "cloning theme"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
#fi

#if [[ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-z" ]]; then
  info "cloning plugin "
  git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-z
#fi


read "REPLY?Symlink ./homedir/* files in ~/ (these are the dotfiles)? [y|N] "
if [[ "$REPLY" =~ ^[Yy] ]]; then
  info "creating symlinks for project dotfiles..."
  pushd homedir > /dev/null 2>&1
  now=$(date +"%Y.%m.%d.%H.%M.%S")

  for file in .*; do
    if [[ $file == "." || $file == ".." ]]; then
      continue
    fi
    running "~/$file"
    # if the file exists:
    if [[ -e ~/$file ]]; then
        mkdir -p ~/.dotfiles_backup/$now
        mv ~/$file ~/.dotfiles_backup/$now/$file
        echo "backup saved as ~/.dotfiles_backup/$now/$file"
    fi
    # symlink might still exist
    unlink ~/$file > /dev/null 2>&1
    # create the link
    ln -s ~/.dotfiles/homedir/$file ~/$file
    echo -en '\tlinked';ok
  done

  popd > /dev/null 2>&1
fi

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add pnpm
asdf plugin add ruby
asdf plugin add python
asdf plugin add 1password-cli
asdf install

brew update && brew upgrade && brew cleanup

printf "✨  Done!\n"