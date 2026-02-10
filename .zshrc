# GNU coreutils timeout alias
alias timeout="gtimeout"
export PATH="$HOME/bin:$PATH"

# Auto-activate .venv if exists in current directory
[[ -f ".venv/bin/activate" ]] && source .venv/bin/activate

# Claude Code alias
alias cc="claude --allow-dangerously-skip-permissions --chrome"
