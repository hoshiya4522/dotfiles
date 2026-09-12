source /opt/ros/jazzy/setup.zsh

# if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
#     export QT_QPA_PLATFORM=wayland
# else
#     export QT_QPA_PLATFORM=xcb
# fi

# This seems to work both in wayland and in xorg, ironically
export QT_QPA_PLATFORM=xcb

eval "$(register-python-argcomplete ros2)"
eval "$(register-python-argcomplete colcon)"

export XCURSOR_SIZE=96
export XCURSOR_THEME=breeze_cursors
