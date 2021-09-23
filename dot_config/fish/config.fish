if status --is-interactive
  rbenv init - | source
  # Add bin path after rbenv
  set -p PATH .git/safe/../../bin
end
