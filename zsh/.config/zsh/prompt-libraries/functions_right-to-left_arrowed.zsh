# Function for checking git repos if they are dirty
prompt_zshgod_right-to-left_git_dirty() {
    # Checks if we're in a git repo
    command git rev-parse --is-inside-work-tree &>/dev/null || return

    # Checks if it's dirty
    local umode="-uno"
    command test -n "$(git status --porcelain --ignore-submodules ${umode} 2>/dev/null | head -100)"

    # Prints "*" if repo is dirty
    (($? == 0)) && print "%F{$prompt_thm_peach}%S %K{$prompt_thm_crust}*%k %s%f"
}

# Function which outputs current branch when called
prompt_zshgod_right-to-left_git_branch() {
    # Check if we're inside a git repository
    command git rev-parse --is-inside-work-tree &>/dev/null || return

    # Get the current branch name (fast and reliable)
    local branch="$(command git branch --show-current 2>/dev/null)"

    # Only output if we successfully got a branch name
    [[ -n "$branch" ]] && print "%F{$prompt_thm_green}%S %K{$prompt_thm_crust}$branch%k %s%f"
}

prompt_zshgod_right-to-left_git_info() {
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

    # Check if staged count is zero or not and add it to the parts[] array
    (( staged_count > 0 )) && parts+=("%K{$prompt_thm_green}${staged_count}+%k")

    # Check if modified count is zero or not and add it to the parts[] array
    (( modified_count > 0 )) && parts+=("%K{$prompt_thm_yellow}${modified_count}*%k")

    # Check if deleted count is zero or not and add it to the parts[] array
    (( deleted_count > 0 )) && parts+=("%K{$prompt_thm_red}${deleted_count}-%k")

    # Check if untracked count is zero or not and add it to the parts[] array
    (( untracked_count > 0 )) && parts+=("%K{$prompt_thm_sky}${untracked_count}?%k")

    # Check if ahead count is zero or not and add it to the parts[] array
    (( ahead_count > 0 )) && parts+=("%K{$prompt_thm_lavender}${ahead_count}↑%k")

    # If there's anything to show, join the parts and do some customization
    if (( ${#parts[@]} > 0 )); then
        print "%F{$prompt_thm_overlay_0}%S ${parts[*]} %s%f"
    fi
}

# Function for showing arrow with customly formatted current time
prompt_zshgod_right-to-left_time() {
    print "%F{$prompt_thm_yellow}%S %K{$prompt_thm_crust}%D{%H:%M:%S}%k %s%f"
}

# Function which returns exectime for last executed command
# This function uses environment variables from two other functions to work correctly
prompt_zshgod_right-to-left_exectime() {
    if (( ${+PROMPT_ZSHGOD_CMD_DURATION} && PROMPT_ZSHGOD_CMD_DURATION >= PROMPT_ZSHGOD_EXECTIME_MIN )); then
        print "%F{$prompt_thm_yellow}%S %K{$prompt_thm_crust}${PROMPT_ZSHGOD_CMD_DURATION}s%k %s%f"
    fi
}

# Function for showing arrow with current working directory
prompt_zshgod_right-to-left_current-pwd() {
    print "%F{$prompt_thm_blue}%S %K{$prompt_thm_crust}%~%k %s%f"
}

# Function which shows arrow with current username@hostname
prompt_zshgod_right-to-left_userandhostname() {
    print "%(!,%F{$prompt_thm_red}%S %K{$prompt_thm_crust}%n%k %s%f,%F{$prompt_thm_green}%S %K{$prompt_thm_crust}%n%k %s%f)%F{$prompt_thm_yellow}%S %K{$prompt_thm_crust}@%k %s%f%F{$prompt_thm_sky}%S %K%m%k %s%f"

}

# Function which returns prompt_zshgod_right-to-left_userandhostname only when connected to ssh
prompt_zshgod_right-to-left_sshonly_userandhostname() {
    if [[ -n $SSH_CONNECTION ]]; then
        prompt_zshgod_right-to-left_userandhostname
    fi
}

# Function which shows colored arrow with different color if current user is root
prompt_zshgod_right-to-left_root-indicator () {
    print "%(!,%F{$prompt_thm_red}%S %K{$prompt_thm_crust}#%k %s%f,%F{$prompt_thm_green}%S %K{$prompt_thm_crust}\$%k %s%f)"
}

# Function which returns colored arrow with current username with different color if current user is root
prompt_zshgod_right-to-left_username() {
    print "%(!,%F{$prompt_thm_red}%S %K{$prompt_thm_crust}%n%k %s%f,%F{$prompt_thm_green}%S %K{$prompt_thm_crust}%n%k %s%f)"
}

# Same function as prompt_zshgod_right-to-left_username but shown only through ssh
prompt_zshgod_right-to-left_sshonly_username() {
    if [[ -n $SSH_CONNECTION ]]; then
        prompt_zshgod_right-to-left_username
    fi
}

# Function which returns colored arrow with current hostname
prompt_zshgod_right-to-left_hostname() {
    print "%F{$prompt_thm_crust}%K{$prompt_thm_sky} %m %k%f"
}

# Same function as prompt_zshgod_right-to-left_hostname but shown only through ssh
prompt_zshgod_right-to-left_sshonly_hostname() {
    if [[ -n $SSH_CONNECTION ]]; then
        prompt_zshgod_right-to-left_hostname
    fi
}

