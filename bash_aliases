
# ====== Colored virtualenv prompt for bash ======

# Define color and bold codes
VENV_PROMPT_COLOR=$'\x1b[1;36m'
VENV_CHANGE_COLOR=$'\x1b[1;36;41m'
VENV_WALKED_COLOR=$'\x1b[0,36m'
NC=$'\x1b[0m' # No Color (reset formatting)
VENV_COLOR="$VENV_PROMPT_COLOR"
vactivate(){
	if [ -f ".venv/bin/activate" ]; then
		. .venv/bin/activate
		if [ -n "$VIRTUAL_ENV" ]; then
			if [ -z "$_prev_venv" -o \( -n "$_prev_venv" -a "$_prev_venv" != "$VIRTUAL_ENV" \) ]; then
				VENV_COLOR="$VENV_CHANGE_COLOR"
			else
				VENV_COLOR="$VENV_PROMPT_COLOR"
			fi
			export _prev_venv="$VIRTUAL_ENV"
		fi
	else
		VENV_COLOR="$VENV_WALKED_COLOR"
	fi
}
PROMPT_COMMAND=vactivate
# Disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1


# Function to get the virtual environment name
function virtualenv_info(){
  if [[ -n "$VIRTUAL_ENV" ]]; then
    # Strip out the path and just leave the env name
    venv_name="${VIRTUAL_ENV##*/}"
    [ "$venv_name" == ".venv" ] && venv_name=$(basename `dirname $VIRTUAL_ENV`)
    echo "($venv_name) "
  fi
}

# Add the colored venv name to your PS1 (adjust your PS1 as needed)
# Example PS1: [user@host dir] (venv_name) $ 
# PS1="[\u@\h \w] $(virtualenv_info)\$ " # This example adds it after the directory

# A more complete example that colors the venv name bold blue:
# PS1='\[\e[1;32m\][\u@\h \w]\[\e[0m\]'"${BOLD_BLUE}\$(virtualenv_info)${NC}"' \$ '

PS1='\[${VENV_COLOR}\]$(virtualenv_info)\[${NC}\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '



qc(){
	bc -ql <<_EOF_
	$*
_EOF_
}

p3(){
	python3 $*
}

dir(){
	ls -Fla $*
}

cdr(){
	cd $( realpath $1 );
}

realcd(){
	builtin cd $*
}

cd(){
	if [ "" == "$1" ]; then
		builtin cd
		return
	fi
	if [ -d "$1" ]; then
		if [ -d `realpath "$1"` ]; then
			builtin cd `realpath "$1"`
		else
			builtin cd "$1"
		fi
	else
		builtin cd "$1"
	fi
}



