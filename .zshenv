export PATH=/usr/local/bin:$PATH
export ORACLE_HOME=$HOME/opt/oracle
export PATH=${ORACLE_HOME}/bin:$PATH
export DYLD_LIBRARY_PATH=${ORACLE_HOME}/lib

# for go lang
if [ -x "`which go`" ]; then
  export GOPATH=$HOME/go
  export PATH="$GOPATH/bin:$PATH"
fi

# for git/diff-highlight
GIT_VERSION=`git --version | cut -d ' ' -f3`
export PATH=$PATH:/usr/local/Cellar/git/$GIT_VERSION/share/git-core/contrib/diff-highlight
