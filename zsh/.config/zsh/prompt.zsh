# [ Title with useful information ]
# Zsh-God prompt
# by Xeks4237: https://gitlab.com/Xeks4237
# Licensed under: MIT License

# Zsh substitutions:
# %F{} => Colors everything after it, can use HEX, and mono RGB like #000000 and 000 values
# %f => Resets coloring after itself
# %~ => Current path relative to $HOME directory
# %n => Shows $USERNAME of the surrent user
# %m => Shows hostname up to the first `.' symbols
# %# => Shows "#" if shell is privileged, if not "%", its same as "%(!,#,%%)"
# %D{} => Shows customly formatted time, like soo "%H:%M:%S.%."
# %(?,,) => prompt condition for doing some logic, %(condition,true,false)

# Terminal codes:
# \e7   => save cursor position
# \e[2A => move cursor 2 lines up
# \e[1G => go to position 1 in terminal
# \e8   => restore cursor position
# \e[K  => clears everything after the cursor on the current line
# \e[2K => clear everything on the current line

# [ Configuration Variables ]
# NOTE: I used Catppuccin Mocha Colors from https://github.com/catppuccin
# Main colors
thm_rosewater="#f5e0dc"
thm_flamingo="#f2cdcd"
thm_pink="#f5c2e7"
thm_mauve="#cba6f7"
thm_red="#f38ba8"
thm_maroon="#eba0ac"
thm_peach="#fab387"
thm_yellow="#f9e2af"
thm_green="#a6e3a1"
thm_teal="#94e2d5"
thm_sky="#89dceb"
thm_sapphire="#74c7ec"
thm_blue="#89b4fa"
thm_lavender="#b4befe"

# Main surface and overlay colors
thm_subtext_1="#a6adc8"
thm_subtext_0="#bac2de"
thm_fg="#cdd6f4"
thm_overlay_2="#9399b2"
thm_overlay_1="#7f849c"
thm_overlay_0="#6c7086"
thm_surface_2="#585b70"
thm_surface_1="#45475a"
thm_surface_0="#313244"
thm_mantle="#181825"
thm_crust="#11111b"
thm_bg="#1e1e2e"

PROMPT_LEAN_TMUX=${PROMPT_LEAN_TMUX-"t "}
PROMPT_LEAN_PATH_PERCENT=${PROMPT_LEAN_PATH_PERCENT-60}
PROMPT_LEAN_NOTITLE=${PROMPT_LEAN_NOTITLE-0}
PROMPT_LEAN_CMD_MAX_EXEC_TIME=5
PROMPT_LEAN_ABBR_METHOD=${PROMPT_LEAN_ABBR_METHOD-"truncate"}
PROMPT_LEAN_VCS=${PROMPT_LEAN_VCS-1}
PROMPT_LEAN_PWD=${PROMPT_LEAN_PWD-1}

prompt_zshgod_help() {
    cat <<"EOF"
Lean is a one line prompt that tries to stay out of your face. It utilizes
the right side prompt for most information, like the current working directory
and version control system (only Git)info. The left side of the prompt is only
a "%". The only other information shown on the left are the jobs numbers of
background jobs. When the exit code of a process isn't zero the prompt turns
red. If a process takes more then 5 (default) seconds to run the total running
time is shown in the next prompt.

You can invoke it thus:

  prompt lean

Several aspects Lean can be configured:

PROMPT_LEAN_TMUX:   used to indicate being in tmux, set to "t " by default
PROMPT_LEAN_LEFT:   executed to allow custom information in the left side
PROMPT_LEAN_RIGHT:  executed to allow custom information in the right side
PROMPT_LEAN_VIMODE: used to determine whether or not to display indicator
PROMPT_LEAN_PWD:    when set to 0, disables showing CWD in the prompt
PROMPT_LEAN_VCS:    when set to 0, disables git details from the prompt, the
                    branch name is truncated if it's longer than 20
                    characters
PROMPT_LEAN_VIMODE_FORMAT:
                    defaults to "%F{red}[NORMAL]%f"
PROMPT_LEAN_NOTITLE:
                    used to determine wether or not to set title, set to 0
                    by default
PROMPT_LEAN_ABBR_METHOD:
                    used to indicate the abbreviation method for directory
                    paths. Set it either to "truncate" (default) or "shrink"
                    (fish-style working directory)
EOF
}

# Turns seconds into human readable time, 165392 => 1d 21h 56m 32s
prompt_zshgod_human_time() {
    local tmp=$1
    local days=$(( tmp / 60 / 60 / 24 ))
    local hours=$(( tmp / 60 / 60 % 24 ))
    local minutes=$(( tmp / 60 % 60 ))
    local seconds=$(( tmp % 60 ))
    (( $days > 0 )) && echo -n "${days}d "
    (( $hours > 0 )) && echo -n "${hours}h "
    (( $minutes > 0 )) && echo -n "${minutes}m "
    echo "${seconds}s "
}

# Displays the exec time of the last command if set threshold was exceeded
prompt_zshgod_cmd_exec_time() {
    local stop=$EPOCHSECONDS
    local start=${cmd_timestamp:-$stop}
    integer elapsed=$stop-$start
    (($elapsed > ${PROMPT_LEAN_CMD_MAX_EXEC_TIME})) && prompt_zshgod_human_time $elapsed
}

# Fastest possible way to check if repo is dirty
prompt_zshgod_git_dirty() {
    if [[ $PROMPT_LEAN_VCS != 1 ]]; then
        return
    fi
    # check if we're in a git repo
    command git rev-parse --is-inside-work-tree &>/dev/null || return
    # check if it's dirty
    local umode="-uno" # || local umode="-unormal"
    command test -n "$(git status --porcelain --ignore-submodules ${umode} 2>/dev/null | head -100)"

    (($? == 0)) && echo "*"
}

prompt_zshgod_set_title() {
    # prints: <cwd><space><optional machine if ssh - like rprompt><space><command>
    print -Pn "\e]0;"
    print -Pn "%1~"
    [[ "$SSH_CONNECTION" != "" ]] && print -Pn " %m"
    print -rn "     $1"
    print -Pn "\a"
}

prompt_zshgod_preexec() {
    typeset -g cmd_timestamp=$EPOCHSECONDS
    (($PROMPT_LEAN_NOTITLE != 1)) && prompt_zshgod_set_title "$1"
}

prompt_zshgod_pwd() {
    local lean_path='$(print -Pn "%~")'
    if (($#lean_path / $COLUMNS.0 * 100 > ${PROMPT_LEAN_PATH_PERCENT:=60})); then
        case "$PROMPT_LEAN_ABBR_METHOD" in
            "truncate") prompt_zshgod_abbr_truncate ;;
            "shrink")   prompt_zshgod_abbr_shrink ;;
        esac
        return
    fi
    print "$lean_path"
}

prompt_zshgod_abbr_truncate() {
    print -Pn "...%2/"
}

prompt_zshgod_abbr_shrink() {
    setopt local_options extendedglob histsubstpattern

    local lean_path=$(print -Pn "%~")
    local maxlen=$((PROMPT_LEAN_PATH_PERCENT * COLUMNS / 100))
    local prevlen=0

    # iterate until target length achieved or no more abbreviation possible
    while (($#lean_path > maxlen && $#lean_path != prevlen)); do
        prevlen=$#lean_path
        lean_path=${lean_path:s_(#b)([^/])([^/])##/_$match[1]/_}
    done

    echo $lean_path
}

prompt_zshgod_precmd() {
    [[ $PROMPT_LEAN_VCS == 1 ]] && vcs_info 2>/dev/null
    rehash

    local jobs
    local prompt_zshgod_jobs
    unset jobs
    for a (${(k)jobstates}) {
        j=$jobstates[$a];i="${${(@s,:,)j}[2]}"
        jobs+=($a${i//[^+-]/})
    }
    # Print with [ ] and comma separated
    prompt_zshgod_jobs=""
    [[ -n $jobs ]] && prompt_zshgod_jobs="%F{"$thm_green"}["${(j:,:)jobs}"] "

    local lean_vimode_default="%F{red}[NORMAL]%f"
    # If LEAN_VIMODE is set, set lean_vimode_indicator to either PROMPT_LEAN_VIMOD_FORMAT or a default value
    local lean_vimode_indicator="${PROMPT_LEAN_VIMODE:+${PROMPT_LEAN_VIMODE_FORMAT:-${lean_vimode_default}}}"

    prompt_zshgod_vimode="${${KEYMAP/vicmd/$lean_vimode_indicator}/(main|viins)/}"

    setopt promptsubst
    local vcs_info_str=""
    [[ $PROMPT_LEAN_VCS == 1 ]] && vcs_info_str="$vcs_info_msg_0_" # avoid https://github.com/njhartwell/pw3nage
    PROMPT="$prompt_zshgod_jobs%F{$thm_green}${prompt_zshgod_tmux}%f$($PROMPT_LEAN_LEFT)%f%(?.%F{$thm_blue}.%B%F{203})%#%f%k%b "

    local lean_pwd=""
    [[ $PROMPT_LEAN_PWD == 1 ]] && lean_pwd=$(prompt_zshgod_pwd)
    RPROMPT="%F{$thm_yellow}$(prompt_zshgod_cmd_exec_time)%f$prompt_zshgod_vimode%F{$thm_blue}$lean_pwd%F{$thm_green}$vcs_info_str$(prompt_zshgod_git_dirty)$prompt_zshgod_host%f$($PROMPT_LEAN_RIGHT)%f"

    (($PROMPT_LEAN_NOTITLE != 1)) && prompt_zshgod_set_title "$1"

    unset cmd_timestamp # Reset value since "preexec" isn't always triggered
}

function zle-keymap-select {
    prompt_zshgod_precmd
    zle reset-prompt
}

prompt_zshgod_setup() {
    prompt_opts=(cr percent sp subst)

    zmodload zsh/datetime
    autoload -Uz add-zsh-hook
    [[ $PROMPT_LEAN_VCS == 1 ]] && autoload -Uz vcs_info

    [[ "$PROMPT_LEAN_VIMODE" != "" ]] && zle -N zle-keymap-select

    add-zsh-hook precmd prompt_zshgod_precmd
    add-zsh-hook preexec prompt_zshgod_preexec

    if [[ $PROMPT_LEAN_VCS == 1 ]]; then
        zstyle ":vcs_info:*" enable git
        zstyle ":vcs_info:git*" formats " %25>...>%b%>>"
        zstyle ":vcs_info:git*" actionformats " %25>...>%b%>>|%a"
    fi

    [[ "$SSH_CONNECTION" != "" ]] && prompt_zshgod_host=" %F{"$thm_yellow"}%m%f"
    [[ "$TMUX" != "" ]] && prompt_zshgod_tmux=$PROMPT_LEAN_TMUX

    return 0
}

prompt_zshgod_setup "$@"

