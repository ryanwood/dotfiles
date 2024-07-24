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

fish_add_path /opt/homebrew/bin /Applications/Postgres.app/Contents/Versions/latest/bin
source /opt/homebrew/opt/asdf/libexec/asdf.fish
# ASDF prepends to the PATH directly so they are not in `fish_user_path`. Unfortunately we need to
# use `fish_add_path` with --move so that the order is maintained in subshells and prevents reordering in TMUX.
fish_add_path -m "$ASDF_DIR/bin"
fish_add_path -m "$HOME/.asdf/shims"
set -p PATH .git/safe/../../bin
