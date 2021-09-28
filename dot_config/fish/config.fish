if status --is-interactive
  rbenv init - | source
  # Add bin path after rbenv
  set -p PATH .git/safe/../../bin
end

# For brew installed postgresql@10
fish_add_path /usr/local/opt/postgresql@10/bin
set -gx LDFLAGS "-L/usr/local/opt/postgresql@10/lib"
set -gx CPPFLAGS "-I/usr/local/opt/postgresql@10/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/postgresql@10/lib/pkgconfig"

# General exports
set -gx EDITOR nvim
set -gx RIPGREP_CONFIG_PATH ~/.ripgreprc
set -gx FZF_DEFAULT_COMMAND "rg --files"
set -gx FZF_DEFAULT_OPTS "-m"

set -gx nvm_default_version v12.22.6
