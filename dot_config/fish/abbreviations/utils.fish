abbr ..    'cd ..'
abbr ...   'cd ../..'
abbr ....  'cd ../../..'
abbr ..... 'cd ../../../..'
abbr /     'cd /'
abbr ~     'cd ~'

abbr reload 'source ~/.config/fish/config.fish'

abbr hide_hidden 'defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder'
abbr show_hidden 'defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder'

# exit
abbr :q  'exit'
abbr :q! 'exit'

# Autojump
abbr j  'z'
