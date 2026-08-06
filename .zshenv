typeset -U path
path=(
  ${ASDF_DATA_DIR:-$HOME/.asdf}/shims
  $HOME/.local/bin
  $HOME/.cargo/bin
  $HOME/.deno/bin
  # git/config's [pager] pipes through diff-highlight. Ubuntu's git ships it here,
  # under a docs dir and off PATH; setup.sh adds the missing exec bit.
  # Absent on mac (Homebrew git puts an executable one in share/git-core), and a
  # nonexistent entry costs nothing, so this line is unconditional.
  /usr/share/doc/git/contrib/diff-highlight
  $path
)

export EDITOR=nvim
