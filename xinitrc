feh --bg-scale "/home/arun/pics/curtns-darkblue.png"
xset m 5
#xrdb -remove /home/arun/.Xdefaults
#xrdb -merge /home/arun/.Xdefaults
while true; do
#    remaining=$(awk '/^remain/ { print $3 }' /proc/acpi/battery/BAT0/state)
#    max=$(awk '/^design capacity:/ { print $3 }' /proc/acpi/battery/BAT0/info)
#    percent=$(echo "100.0 * $remaining / $max" | bc)
	batt=$(/usr/bin/acpi -b | awk -F',' '{ print $2 }')

    now=$(date "+%a, %d %b %Y | %I:%M %p") 
#	wifi=$(iwconfig eth1 | grep -q unasso || echo ' | .oO')
	xsetroot -name "${now} | Batt:${batt}";
    sleep 5
done &
#xbacklight -set 0
exec /usr/local/bin/dwm
#exec /usr/local/bin/scrotwm
