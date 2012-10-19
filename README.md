# .dotfiles

This is an attemt to understand and perhaps standardize a reproducable computing environment. Mostly for use on OS X.

## Requirements

* [Mac OS X](http://www.apple.com/macosx/)

* [Command Line Tools for Xcode](http://developer.apple.com/downloads)

* [Homebrew](https://github.com/mxcl/homebrew):
```bash
ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
```

* [Git](http://git-scm.com/):
```bash
brew install git
```

* [Ruby](http://www.ruby-lang.org/en/):
```bash
brew install ruby
```

### Installation

```bash
cd && git clone https://github.com/user36634/.dotfiles.git && cd ~/.dotfiles && ./bin/install.rb
```

## Credits

* Ethan Schoonover's  Solarized palette is an eye-pleasing submodule ([altercation's vim-colors-solarized bundle](https://github.com/altercation/vim-colors-solarized))

* [Zen Coding](http://code.google.com/p/zen-coding/) is a time-saving submodule ([mattn's zencoding-vim bundle](https://github.com/mattn/zencoding-vim))

