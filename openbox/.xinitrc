# Default to single-monitor setup with xrandr
if [[ -z "$MON" ]]; then 
	MON=1;
fi

# Pull in Xresources beforehand
xrdb -merge .Xresources


# Two monitor setup; 4K + ultrawide in portrait
if [[ $MON == 2 ]]; then
	xrandr --output DisplayPort-0 --mode 3440x1440 \
		--right-of DisplayPort-1 --rotate right --pos 3840x+0
	xrandr --output DisplayPort-1 --mode 3840x2160 --pos 0x+992 \
		--primary
fi

# Single 4K monitor setup
if [[ $MON == 1 ]]; then
	xrandr --output DisplayPort-0 --off
	xrandr --output DisplayPort-1 --mode 3840x2160 \
		--pos 0x+992 --primary
fi

# Think these are necessary for the IME setup with ibus
export GTK_IM_MODULE='ibus'
export QT_IM_MODULE='ibus'
export XMODIFIERS='@im=ibus'

# Fork various daemons
compton &
sxhkd &
ibus-daemon --xim -d -r &
nitrogen --restore

# Fork openbox
exec openbox-session
