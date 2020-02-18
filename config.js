module.exports = {
  brew: [
    'ansible',
    'mongodb',
    'memcached',
    'redis',
    'boost',
    'cgal',
    'cppunit',
    'cmake',
    // http://conqueringthecommandline.com/book/ack_ag
    'ack',
    'ag',
    // https://github.com/wting/autojump
    'autojump',
    // alternative to `cat`: https://github.com/sharkdp/bat
    'bat',
    // Install GNU core utilities (those that come with macOS are outdated)
    // Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
    'coreutils',
    'dos2unix',
    // Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
    'findutils',
    // 'fortune',
    'fzf',
    'readline', // ensure gawk gets good readline
    'gawk',
    // http://www.lcdf.org/gifsicle/ (because I'm a gif junky)
    'gifsicle',
    'gnupg',
    // Install GNU `sed`, overwriting the built-in `sed`
    // so we can do "sed -i 's/foo/bar/' file" instead of "sed -i '' 's/foo/bar/' file"
    'gnu-sed --with-default-names',
    // upgrade grep so we can get things like inverted match (-v)
    'grep --with-default-names',
    // https://github.com/jkbrzt/httpie
    'httpie',
    // jq is a sort of JSON grep
    'jq',
    // Mac App Store CLI: https://github.com/mas-cli/mas
    'mas',
    // Install some other useful utilities like `sponge`
    'moreutils',
    'nmap',
    'openconnect',
    'reattach-to-user-namespace',
    'screen',
    'tmux',
    'todo-txt',
    'tree',
    'ttyrec',
    // better, more recent vim
    'vim --with-client-server --with-override-system-vi',
    'watch',
    // Install wget with IRI support
    'wget --enable-iri'
  ],
  cask: [
    'logitech-options', 
    'nordvpn',
    'dropbox',
    'lingon-x',
    'visual-studio-code',
    '1password',
    'google-backup-and-sync',
    'slack',
    'diffmerge',
    'iterm2',
    'osxfuse',
    'sizeup',
    'tower',
    'transmission',
    'vlc',
    'caffeine',
    'transmit',
    'istat-menus',
    'daisydisk',
    'dash',
    'firefox',
    'google-chrome',
    'google-chrome-canary',
    'torbrowser',
    // 'fritzing'
    // 'arduino'
    // 'processing'
    'sqlpro-studio',
    'vnc-viewer',
    'virtualbox',
    'docker', // docker for mac
    //'flux',
    'gpg-suite',
    'little-snitch',
    'macbreakz',
    'micro-snitch',
    'signal',
    'sizeup',
    //'sketchup',
    'slack',
    'the-unarchiver',
  ],
  gem: [
  ],
  npm: [
  ],
  yarn: [
    'eslint',
    'instant-markdown-d',
    'npm-check-updates',
    'prettyjson',
    'trash',
    'vtop'
  ],
  pip: [
    'flake-8',
    'virtualenv',
    'virtualenvwrapper'
  ],
  mas: [
    '409907375', // Remote Desktop (3.9.3)
    '497799835', // Xcode (11.3.1)
    //'1381004916', // Discovery (2.0.3)
    '715768417', // Microsoft Remote Desktop (8.0.30030)
    '429449079', // Patterns (1.2)
  ],
};