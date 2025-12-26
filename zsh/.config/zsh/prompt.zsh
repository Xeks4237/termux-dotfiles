# [ Title with useful information ]
# Zsh-God prompt
# by Xeks4237: https://gitlab.com/Xeks4237
# Licensed under: MIT License

# Zsh substitutions:
# %F{} => Colors everything after it
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
PROMPT_ZSHGOD_TMUX=${PROMPT_ZSHGOD_TMUX-"t "}
PROMPT_ZSHGOD_PATH_PERCENT=${PROMPT_ZSHGOD_PATH_PERCENT-60}
PROMPT_ZSHGOD_NOTITLE=${PROMPT_ZSHGOD_NOTITLE-0}
PROMPT_ZSHGOD_CMD_MAX_EXEC_TIME=5
PROMPT_ZSHGOD_ABBR_METHOD=${PROMPT_ZSHGOD_ABBR_METHOD-"truncate"}
PROMPT_ZSHGOD_VCS=${PROMPT_ZSHGOD_VCS-1}
PROMPT_ZSHGOD_PWD=${PROMPT_ZSHGOD_PWD-1}

# NOTE: I used Catppuccin Mocha Colors from:
# https://github.com/catppuccin
# Main colors
PROMPT_ZSHGOD_THM_rosewater="#f5e0dc"
PROMPT_ZSHGOD_THM_flamingo="#f2cdcd"
PROMPT_ZSHGOD_THM_pink="#f5c2e7"
PROMPT_ZSHGOD_THM_mauve="#cba6f7"
PROMPT_ZSHGOD_THM_red="#f38ba8"
PROMPT_ZSHGOD_THM_maroon="#eba0ac"
PROMPT_ZSHGOD_THM_peach="#fab387"
PROMPT_ZSHGOD_THM_yellow="#f9e2af"
PROMPT_ZSHGOD_THM_green="#a6e3a1"
PROMPT_ZSHGOD_THM_teal="#94e2d5"
PROMPT_ZSHGOD_THM_sky="#89dceb"
PROMPT_ZSHGOD_THM_sapphire="#74c7ec"
PROMPT_ZSHGOD_THM_blue="#89b4fa"
PROMPT_ZSHGOD_THM_lavender="#b4befe"

# Main surface and overlay colors
PROMPT_ZSHGOD_THM_subtext_1="#a6adc8"
PROMPT_ZSHGOD_THM_subtext_0="#bac2de"
PROMPT_ZSHGOD_THM_fg="#cdd6f4"
PROMPT_ZSHGOD_THM_overlay_2="#9399b2"
PROMPT_ZSHGOD_THM_overlay_1="#7f849c"
PROMPT_ZSHGOD_THM_overlay_0="#6c7086"
PROMPT_ZSHGOD_THM_surface_2="#585b70"
PROMPT_ZSHGOD_THM_surface_1="#45475a"
PROMPT_ZSHGOD_THM_surface_0="#313244"
PROMPT_ZSHGOD_THM_mantle="#181825"
PROMPT_ZSHGOD_THM_crust="#11111b"
PROMPT_ZSHGOD_THM_bg="#1e1e2e"

# [ Functions ]
prompt_zshgod_help() {
    cat <<"EOF"
ZshGod is a one line prompt that tries to stay out of your face. It utilizes
the right side prompt for most information, like the current working directory
and version control system (only Git)info. The left side of the prompt is only
a "%". The only other information shown on the left are the jobs numbers of
background jobs. When the exit code of a process isn't zero the prompt turns
red. If a process takes more then 5 (default) seconds to run the total running
time is shown in the next prompt.

You can invoke it thus:

  prompt lean

Several aspects Lean can be configured:

PROMPT_ZSHGOD_TMUX:   used to indicate being in tmux, set to "t " by default
PROMPT_ZSHGOD_LEFT:   executed to allow custom information in the left side
PROMPT_ZSHGOD_RIGHT:  executed to allow custom information in the right side
PROMPT_ZSHGOD_VIMODE: used to determine whether or not to display indicator
PROMPT_ZSHGOD_PWD:    when set to 0, disables showing CWD in the prompt
PROMPT_ZSHGOD_VCS:    when set to 0, disables git details from the prompt, the
                    branch name is truncated if it's longer than 20
                    characters
PROMPT_ZSHGOD_VIMODE_FORMAT:
                    defaults to "%F{red}[NORMAL]%f"
PROMPT_ZSHGOD_NOTITLE:
                    used to determine wether or not to set title, set to 0
                    by default
PROMPT_ZSHGOD_ABBR_METHOD:
                    used to indicate the abbreviation method for directory
                    paths. Set it either to "truncate" (default) or "shrink"
                    (fish-style working directory)
EOF
}

# turns seconds into human readable time, 165392 => 1d 21h 56m 32s
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

# displays the exec time of the last command if set threshold was exceeded
prompt_zshgod_cmd_exec_time() {
    local stop=$EPOCHSECONDS
    local start=${cmd_timestamp:-$stop}
    integer elapsed=$stop-$start
    (($elapsed > ${PROMPT_ZSHGOD_CMD_MAX_EXEC_TIME})) && prompt_zshgod_human_time $elapsed
}

# fastest possible way to check if repo is dirty
prompt_zshgod_git_dirty() {
    if [[ $PROMPT_ZSHGOD_VCS != 1 ]]; then
        return
    fi
    # check if we're in a git repo
    command git rev-parse --is-inside-work-tree &>/dev/null || return
    # check if it's dirty
    local umode="-uno" #|| local umode="-unormal"
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
    (($PROMPT_ZSHGOD_NOTITLE != 1)) && prompt_zshgod_set_title "$1"
}

prompt_zshgod_pwd() {
    local lean_path='$(print -Pn "%~")'
    if (($#lean_path / $COLUMNS.0 * 100 > ${PROMPT_ZSHGOD_PATH_PERCENT:=60})); then
        case "$PROMPT_ZSHGOD_ABBR_METHOD" in
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
    local maxlen=$((PROMPT_ZSHGOD_PATH_PERCENT * COLUMNS / 100))
    local prevlen=0

    # iterate until target length achieved or no more abbreviation possible
    while (($#lean_path > maxlen && $#lean_path != prevlen)); do
        prevlen=$#lean_path
        lean_path=${lean_path:s_(#b)([^/])([^/])##/_$match[1]/_}
    done

    echo $lean_path
}

prompt_zshgod_precmd() {
    [[ $PROMPT_ZSHGOD_VCS == 1 ]] && vcs_info 2>/dev/null
    rehash

    local jobs
    local prompt_zshgod_jobs
    unset jobs
    for a (${(k)jobstates}) {
        j=$jobstates[$a];i="${${(@s,:,)j}[2]}"
        jobs+=($a${i//[^+-]/})
    }
    # print with [ ] and comma separated
    prompt_zshgod_jobs=""
    [[ -n $jobs ]] && prompt_zshgod_jobs="%F{"$PROMPT_ZSHGOD_THM_green"}["${(j:,:)jobs}"] "

    local lean_vimode_default="%F{red}[NORMAL]%f"
    #If LEAN_VIMODE is set, set lean_vimode_indicator to either PROMPT_ZSHGOD_VIMOD_FORMAT or a default value
    local lean_vimode_indicator="${PROMPT_ZSHGOD_VIMODE:+${PROMPT_ZSHGOD_VIMODE_FORMAT:-${lean_vimode_default}}}"

    prompt_zshgod_vimode="${${KEYMAP/vicmd/$lean_vimode_indicator}/(main|viins)/}"

    setopt promptsubst
    local vcs_info_str=""
    [[ $PROMPT_ZSHGOD_VCS == 1 ]] && vcs_info_str="$vcs_info_msg_0_" # avoid https://github.com/njhartwell/pw3nage
    PROMPT="$prompt_zshgod_jobs%F{$PROMPT_ZSHGOD_THM_green}${prompt_zshgod_tmux}%f$($PROMPT_ZSHGOD_LEFT)%f%(?.%F{$PROMPT_ZSHGOD_THM_blue}.%B%F{203})%#%f%k%b "

    local lean_pwd=""
    [[ $PROMPT_ZSHGOD_PWD == 1 ]] && lean_pwd=$(prompt_zshgod_pwd)
    RPROMPT="%F{$PROMPT_ZSHGOD_THM_yellow}$(prompt_zshgod_cmd_exec_time)%f$prompt_zshgod_vimode%F{$PROMPT_ZSHGOD_THM_blue}$lean_pwd%F{$PROMPT_ZSHGOD_THM_green}$vcs_info_str$(prompt_zshgod_git_dirty)$prompt_zshgod_host%f$($PROMPT_ZSHGOD_RIGHT)%f"

    (($PROMPT_ZSHGOD_NOTITLE != 1)) && prompt_zshgod_set_title "$1"

    unset cmd_timestamp # reset value since "preexec" isn't always triggered
}

function zle-keymap-select {
    prompt_zshgod_precmd
    zle reset-prompt
}

prompt_zshgod_setup() {
    prompt_opts=(cr percent sp subst)

    zmodload zsh/datetime
    autoload -Uz add-zsh-hook
    [[ $PROMPT_ZSHGOD_VCS == 1 ]] && autoload -Uz vcs_info

    [[ "$PROMPT_ZSHGOD_VIMODE" != "" ]] && zle -N zle-keymap-select

    add-zsh-hook precmd prompt_zshgod_precmd
    add-zsh-hook preexec prompt_zshgod_preexec

    if [[ $PROMPT_ZSHGOD_VCS == 1 ]]; then
        zstyle ":vcs_info:*" enable git
        zstyle ":vcs_info:git*" formats " %25>...>%b%>>"
        zstyle ":vcs_info:git*" actionformats " %25>...>%b%>>|%a"
    fi

    [[ "$SSH_CONNECTION" != "" ]] && prompt_zshgod_host=" %F{"$PROMPT_ZSHGOD_THM_yellow"}%m%f"
    [[ "$TMUX" != "" ]] && prompt_zshgod_tmux=$PROMPT_ZSHGOD_TMUX

    return 0
}

prompt_zshgod_setup "$@"

