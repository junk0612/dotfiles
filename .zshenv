export PATH=/usr/local/bin:$PATH

# for go lang
if [ -x "`which go`" ]; then
  export GOPATH=$HOME/go
  export PATH="$GOPATH/bin:$PATH"
fi

# for git/diff-highlight
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight
