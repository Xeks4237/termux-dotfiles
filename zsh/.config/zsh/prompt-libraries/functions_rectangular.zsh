# Function for checking git repos if they are dirty
prompt_zshgod_rectangular_git_dirty() {
    # Checks if we're in a git repo
    command git rev-parse --is-inside-work-tree &>/dev/null || return

    # Checks if it's dirty
    local umode="-uno"
    command test -n "$(git status --porcelain --ignore-submodules ${umode} 2>/dev/null | head -100)"

    # Prints "*" if repo is dirty
    (($? == 0)) && print "%F{$prompt_thm_crust}%K{$prompt_thm_peach} * %k%f"
}

# Function which outputs current branch when called
prompt_zshgod_rectangular_git_branch() {
    # Check if we're inside a git repository
    command git rev-parse --is-inside-work-tree &>/dev/null || return

    # Get the current branch name (fast and reliable)
    local branch="$(command git branch --show-current 2>/dev/null)"

    # Only output if we successfully got a branch name
    [[ -n "$branch" ]] && print "%F{$prompt_thm_crust}%K{$prompt_thm_green} $branch %k%f"
}

prompt_zshgod_rectangular_git_info() {
    # Silently exit if not inside a git repository
    command git rev-parse --is-inside-work-tree &>/dev/null || return

    # Fetch machine-readable git status with branch info (includes ahead/behind)
    local git_info="$(command git status --porcelain --branch 2>/dev/null)"

    # If nothing to report (repo clean), output nothing
    [[ -z "$git_info" ]] && return

    # Extract the branch line (starts with "##")
    local branch_line=$(echo "$git_info" | grep "^##")

    # Count how many commits are ahead of upstream (not pushed)
    local ahead_count=0
    if [[ $branch_line =~ "ahead ([0-9]+)" ]]; then
        ahead_count=${match[1]}
    fi

    # Remove branch line to leave only file status lines
    local status_lines=$(echo "$git_info" | grep -v "^##")

    # Count staged changes (new files added, modifications staged, deletes staged, etc.)
    local staged_count=$(echo "$status_lines" | grep -c "^[MADRC] ")

    # Count unstaged modifications to tracked files
    local modified_count=$(echo "$status_lines" | grep -c "^ [MAD] ")

    # Count deleted files (staged + unstaged deletes)
    local deleted_count=$(( $(echo "$status_lines" | grep -c "^[D] ") + $(echo "$status_lines" | grep -c "^ [D] ") ))

    # Count untracked/new files
    local untracked_count=$(echo "$status_lines" | grep -c "^?? ")

    # Build the output parts only if the count is greater than 0
    local parts=()

    (( staged_count > 0 )) && parts+=("%F{$prompt_thm_green}${staged_count}+%f")
    (( modified_count > 0 )) && parts+=("%F{$prompt_thm_yellow}${modified_count}*%f")
    (( deleted_count > 0 )) && parts+=("%F{$prompt_thm_red}${deleted_count}-%f")
    (( untracked_count > 0 )) && parts+=("%F{$prompt_thm_sky}${untracked_count}?%f")
    (( ahead_count > 0 )) && parts+=("%F{$prompt_thm_lavender}${ahead_count}↑%f")

    # If there's anything to show, join the parts add do some customization
    if (( ${#parts[@]} > 0 )); then
        print "%F{$prompt_thm_yellow}%K{$prompt_thm_overlay_0} ${parts[*]} %k%f"
    fi
}

# Function for showing arrow with customly formatted current time
prompt_zshgod_rectangular_time() {
    print "%F{$prompt_thm_crust}%K{$prompt_thm_yellow} %D{%H:%M:%S} %k%f"
}

# Function which returns exectime for commands after it's been called
prompt_zshgod_rectangular_exectime() {
    if (( ${+PROMPT_ZSHGOD_CMD_DURATION} && PROMPT_ZSHGOD_CMD_DURATION >= PROMPT_ZSHGOD_EXECTIME_MIN )); then
        print "%F{$prompt_thm_crust}%K{$prompt_thm_yellow} ${PROMPT_ZSHGOD_CMD_DURATION}s %f%k"
    fi
}

# Function for showing arrow with current working directory
prompt_zshgod_rectangular_current-pwd() {
    print "%F{$prompt_thm_crust}%K{$prompt_thm_blue} %~ %k%f"
}

# Function which shows arrow with current username@hostname
prompt_zshgod_rectangular_userandhostname() {
    print "%(!,%F{$prompt_thm_crust}%K{$prompt_thm_red} %n %k%f,%F{$prompt_thm_crust}%K{$prompt_thm_green} %n %k%f)%F{$prompt_thm_crust}%K{$prompt_thm_yellow} @ %f%k%F{$prompt_thm_crust}%K{$prompt_thm_sky} %m %k%f"
}

# Function which shows colored arrow with different color if current user is root
prompt_zshgod_rectangular_root-indicator () {
    print "%(!,%F{$prompt_thm_crust}%K{$prompt_thm_red} # %k%f,%F{$prompt_thm_crust}%K{$prompt_thm_green} \$ %k%f)"
}

# Function which returns colored arrow with current username with different color if current user is root
prompt_zshgod_rectangular_username() {
    print "%(!,%F{$prompt_thm_crust}%K{$prompt_thm_red} %n %k%f,%F{$prompt_thm_crust}%K{$prompt_thm_green} %n %k%f)"
}

