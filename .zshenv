typeset -U path
path=(
  ${ASDF_DATA_DIR:-$HOME/.asdf}/shims
  $HOME/.local/bin
  $HOME/.cargo/bin
  $HOME/.deno/bin
  $path
)

export EDITOR=nvim
