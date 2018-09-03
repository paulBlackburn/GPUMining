echo Launching Xorg Servers
sudo X :0 &
sleep 10
export DISPLAY=:0
sleep 2

exit 0