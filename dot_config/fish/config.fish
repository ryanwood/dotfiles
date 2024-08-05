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
