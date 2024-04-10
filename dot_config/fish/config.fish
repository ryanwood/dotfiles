if status --is-interactive
    source /opt/homebrew/opt/asdf/libexec/asdf.fish
    # Add bin path after rbenv
    set -p PATH .git/safe/../../bin
end

fish_add_path ~/.bin /opt/homebrew/bin /Applications/Postgres.app/Contents/Versions/latest/bin

source ~/.config/fish/themes/tokyonight_night.fish

# Hydro prompt settings
set hydro_color_pwd $fish_color_command
set hydro_color_git $fish_color_command
set hydro_color_error $fish_color_error
set hydro_color_prompt --dim $fish_color_command
set hydro_color_duration --dim $fish_color_command

# General exports
set -gx EDITOR nvim
set -gx RIPGREP_CONFIG_PATH ~/.ripgreprc
set -gx FZF_DEFAULT_COMMAND "rg --files"
set -gx FZF_DEFAULT_OPTS -m

source ~/.config/fish/abbreviations.fish
