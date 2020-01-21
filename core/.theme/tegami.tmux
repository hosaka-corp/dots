# Pane settings
set -g pane-border-status top
set -g pane-border-format "｢#P: #{pane_current_command}｣"
setw -g pane-active-border-style "fg=#080808"
setw -g pane-border-style "fg=#b0b0b0"

# Status bar settings
set -g status-position top
set -g status-justify left
set -g status-style "bg=#ffffe8 fg=#080808"
set -g status-bg default
set -g status-left " ｢端末#S｣ "
set -g status-right ""

# Window status settings
setw -g window-status-current-style reverse
setw -g window-status-current-format " #[bold]#W#[nobold] "
setw -g window-status-format " #W "
