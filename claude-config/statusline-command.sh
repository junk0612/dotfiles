#!/bin/sh
input=$(cat)
cwd=$(echo "$input" | jq -r '.cwd')
branch=$(GIT_DIR="$(git -C "$cwd" rev-parse --git-dir 2>/dev/null)" git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null || git -C "$cwd" rev-parse --short HEAD 2>/dev/null)

user=$(whoami)
host=$(hostname -s)

# ANSI color codes
CYAN='\033[36m'
BOLD='\033[1m'
GREEN='\033[32m'
MAGENTA='\033[35m'
RESET='\033[0m'

if [ -n "$branch" ]; then
  vcs_info=" (git:$branch)"
else
  vcs_info=""
fi

printf "${BOLD}${CYAN}%s${RESET} at ${GREEN}%s${RESET}${MAGENTA}%s${RESET}" "$user" "$cwd" "$vcs_info"
