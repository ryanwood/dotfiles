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

# Using set PATH directly as that's what ASDF does.
# fish_set_path reorders items in subshells and breaks TMUX.
if not contains /Users/ryanwood/bin $PATH
    set -gx --prepend PATH /Users/ryanwood/bin /opt/homebrew/bin /Applications/Postgres.app/Contents/Versions/latest/bin
end
source /opt/homebrew/opt/asdf/libexec/asdf.fish
if not contains .git/safe/../../bin $PATH
    set -gx --prepend PATH .git/safe/../../bin
end
