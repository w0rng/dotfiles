set fish_greeting

# set private environment variables stored outside source control
test -r ~/.fish.env; and export (cat ~/.fish.env|xargs -L 1)

# load my fish functions
for f in (find ~/.config/fish/w0rng/ -type f  -name '*.fish')
    source $f
end


fish_add_path /Users/w0rng/Library/Application\ Support/JetBrains/Toolbox/scripts
fish_add_path /opt/homebrew/sbin
fish_add_path /Users/w0rng/yandex-cloud/bin