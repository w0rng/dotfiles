set CONFIG_PATH ~/.config/alacritty/alacritty.toml

function _set_alacritty_theme
    set system_theme (defaults read -g AppleInterfaceStyle 2> /dev/null)
    if test "$system_theme" = "Dark"
        sed -i '' -e 's/solarized_light/solarized_dark/' $CONFIG_PATH
    else
        sed -i '' -e 's/solarized_dark/solarized_light/' $CONFIG_PATH
    end
end

_set_alacritty_theme
