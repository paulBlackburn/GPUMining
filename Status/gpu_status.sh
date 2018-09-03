export DISPLAY=:0.0
export XAUTHORITY=/var/run/lightdm/root/:0

rm -f gpu_status.txt

nvidia-smi -q > gpu_status.txt

nvidia-settings -c :0 -q GPUCurrentClockFreqsString >> gpu_status.txt

echo Compiling java files
javac *.java
java Run

rm -f *.class

exit 0