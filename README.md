
# Running
```bash
git clone https://github.com/smukkejohan/dotfiles ~/.dotfiles
cd ~/.dotfiles;
./install.sh;
```

Don't have git installed yet (fresh machine)?
Just download the zip file for this project, unzip it into ~/.dotfiles then
```bash
cd ~/.dotfiles;
./install.sh;
```

# Restoring Dotfiles
If you have existing dotfiles for configuring git, zsh, vim, etc, these will be backed-up into ~/.dotfiles_backup and replaced with the files from this project. You can restore your original dotfiles by using `./restore.sh`

# Additional
- .crontab: you can `cron ~/.crontab` if you want to add nightly cron software updates.
