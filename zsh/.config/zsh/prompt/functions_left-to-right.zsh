# Function for showing arrow with customly formatted current time
prompt_zshgod_time() {
    print "%F{$prompt_thm_yellow}%f%F{$prompt_thm_crust}%K{$prompt_thm_yellow} %D{%H:%M:%S} %k%f%F{$prompt_thm_yellow}%f"
}

# Function which shows colored arrow with different color if current user is root
prompt_zshgod_root-indicator () {
    print "%(!,%F{$prompt_thm_red}%f%F{$prompt_thm_crust}%K{$prompt_thm_red} # %k%f%F{$prompt_thm_red}%f,%F{$prompt_thm_green}%f%F{$prompt_thm_crust}%K{$prompt_thm_green} \$ %k%f%F{$prompt_thm_green}%f)"
}

