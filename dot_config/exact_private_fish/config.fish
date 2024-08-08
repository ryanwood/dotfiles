if status is-interactive
    # Commands to run in interactive sessions can go here

    # Hydro prompt settings
    set hydro_color_pwd $fish_color_command
    set hydro_color_git $fish_color_command
    set hydro_color_error $fish_color_error
    set hydro_color_prompt --dim $fish_color_command
    set hydro_color_duration --dim $fish_color_command
end

set -gx EDITOR nvim

source ~/.config/fish/abbreviations.fish

# Add to fix PATH order in TMUX
fish_add_path --path /Applications/Postgres.app/Contents/Versions/14/bin
fish_add_path --path --move "$ASDF_DIR/bin"
fish_add_path --path --move "$HOME/.asdf/shims"

# Remove and add (required not to duplicate in TMUX shell)
# https://github.com/fish-shell/fish-shell/issues/2639#issuecomment-451260584
set -l git_safe .git/safe/../../bin
if set -l index (contains -i -- $git_safe $PATH)
    set -e PATH[$index]
end
set -p PATH $git_safe
