

# [ Colorschemes ]
%if "#{==:#{@theme},catppuccin_mocha}"
# Catppuccin Mocha colors
set -g @thm_black '#11111B'
set -g @thm_grey '#45475A'
set -g @thm_white '#CDD6F4'
set -g @thm_red '#F38BA8'
set -g @thm_yellow '#F9E2AF'
set -g @thm_green '#A6E3A1'
set -g @thm_blue '#89B4FA'
set -g @thm_purple '#CBA6F7'
set -gqF @thm_foreground '#{@thm_white}'
set -g @thm_background '#1E1E2E'
set -gqF @thm_cursor-color '#{@thm_white}'
set -gqF @thm_accent-color '#{@thm_green}'

%elif "#{==:#{@theme},tokyonight_storm}"
# TokyoNight Storm colors
set -g @thm_black '#24283B'
set -g @thm_grey '#565f89'
set -g @thm_white '#CDD6F4'
set -g @thm_red '#F7768E'
set -g @thm_yellow '#E0AF68'
set -g @thm_green '#9ECE6A'
set -g @thm_blue '#7AA2F7'
set -g @thm_purple '#BB9AF7'
set -gqF @thm_foreground '#{@thm_white}'
set -gqF @thm_background '#{@thm_black}'
set -gqF @thm_cursor-color '#{@thm_white}'
set -gqF @thm_accent-color '#{@thm_green}'

%else
# Default colors
set -g @theme 'default'
set -g @thm_black '#000000'
set -g @thm_grey '#555555'
set -g @thm_white '#FFFFFF'
set -g @thm_red '#FF0000'
set -g @thm_yellow '#FFFF00'
set -g @thm_green '#00FF00'
set -g @thm_blue '#0000FF'
set -g @thm_purple '#800080'
set -gqF @thm_foreground '#{@thm_white}'
set -gqF @thm_background '#{@thm_black}'
set -gqF @thm_cursor-color '#{@thm_white}'
set -gqF @thm_accent-color '#{@thm_green}'
%endif

