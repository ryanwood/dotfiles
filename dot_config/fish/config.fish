if status --is-interactive
  source /opt/homebrew/opt/asdf/libexec/asdf.fish
  # Add bin path after rbenv
  set -p PATH .git/safe/../../bin
end

fish_add_path ~/.bin /opt/homebrew/bin /Applications/Postgres.app/Contents/Versions/latest/bin

# General exports
set -gx EDITOR nvim
set -gx RIPGREP_CONFIG_PATH ~/.ripgreprc
set -gx FZF_DEFAULT_COMMAND "rg --files"
set -gx FZF_DEFAULT_OPTS "-m"
