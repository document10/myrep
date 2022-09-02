xmonad --recompile
xmonad --restart
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
picom -f &
nitrogen --restore &
conky -c ~/.config/conky/monolith.conf &
polybar -r -c .config/polybar/xmonad.ini &
volumeicon &
nm-applet &
blueman-applet &
xfce4-clipman &
