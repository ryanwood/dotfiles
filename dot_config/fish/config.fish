if status --is-interactive
  rbenv init - | source
  # Add bin path after rbenv
  set -p PATH .git/safe/../../bin
end

set -gx EDITOR nvim
set -gx RIPGREP_CONFIG_PATH ~/.ripgreprc
set -gx FZF_DEFAULT_COMMAND "rg --files"
set -gx FZF_DEFAULT_OPTS "-m"
