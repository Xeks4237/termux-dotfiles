# Simple functions for more satisfying plugin management of zsh based on:
# https://github.com/mattmc3/zsh_unplugged

# TODO: Make it peak
typeset -gx ZSH_PLUGIN_DIR="${ZDOTDIR:-${XDG_CONFIG_HOME:-$HOME/.config/}/zsh/}/plugins/"

function plugin-clone {
	local plugin repo commitsha plugdir initfile initfiles=()
	for plugin in $@; do
		repo="$plugin"
		clone_args=(-q --depth 1 --recursive --shallow-submodules)
		# Pin repo to a specific commit sha if provided
		if [[ "$plugin" == *'@'* ]]; then
			repo="${plugin%@*}"
			commitsha="${plugin#*@}"
			clone_args+=(--no-checkout)
		fi
		plugdir=$ZSH_PLUGIN_DIR/${repo:t}
		initfile=$plugdir/${repo:t}.plugin.zsh
		if [[ ! -d $plugdir ]]; then
			echo "Cloning $repo..."
			git clone "${clone_args[@]}" https://github.com/$repo $plugdir
			if [[ -n "$commitsha" ]]; then
				git -C $plugdir fetch -q origin "$commitsha"
				git -C $plugdir checkout -q "$commitsha"
			fi
		fi
		if [[ ! -e $initfile ]]; then
			initfiles=($plugdir/*.{plugin.zsh,zsh-theme,zsh,sh}(N))
			(( $#initfiles )) && ln -sf $initfiles[1] $initfile
		fi
	done
}

function plugin-source {
	local plugdir
	for plugdir in $@; do
		[[ $plugdir = /* ]] || plugdir=$ZSH_PLUGIN_DIR/$plugdir
		fpath+=$plugdir
		local initfile=$plugdir/${plugdir:t}.plugin.zsh
		(( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
	done
}

function plugin-compile {
	autoload -Uz zrecompile
	local f
	for f in $ZSH_PLUGIN_DIR/**/*.zsh{,-theme}(N); do
		zrecompile -pq "$f"
	done
}

function plugin-update {
	for d in $ZSH_PLUGIN_DIR/*/.git(/); do
		echo "Updating ${d:h:t}..."
		command git -C "${d:h}" pull --ff --recurse-submodules --depth 1 --rebase --autostash
	done
}
