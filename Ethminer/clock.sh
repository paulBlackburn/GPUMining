echo Overclocking GPUs

echo Setting Power Limits
sudo nvidia-smi -pm ENABLED

sudo nvidia-smi -i 0, -pl 75
sudo nvidia-smi -i 1, -pl 60
sudo nvidia-smi -i 2, -pl 75
sudo nvidia-smi -i 3, -pl 60

DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [gpu:0]/GPUPowerMizerMode=1
DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [gpu:1]/GPUPowerMizerMode=1
DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [gpu:2]/GPUPowerMizerMode=1
DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [gpu:3]/GPUPowerMizerMode=1

echo Setting Fan Speed

DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [gpu:0]/GPUFanControlState=0
DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [gpu:1]/GPUFanControlState=0
DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [gpu:2]/GPUFanControlState=0
DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [gpu:3]/GPUFanControlState=0

#DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [fan:0]/GPUTargetFanSpeed=45
#DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [fan:1]/GPUTargetFanSpeed=80
#DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [fan:2]/GPUTargetFanSpeed=45
#DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [fan:3]/GPUTargetFanSpeed=80

echo Setting Core Clock

DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [gpu:0]/GPUGraphicsClockOffset[3]=-200
DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [gpu:1]/GPUGraphicsClockOffset[3]=-100
DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [gpu:2]/GPUGraphicsClockOffset[3]=-200
DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [gpu:3]/GPUGraphicsClockOffset[3]=-100

echo Setting Memory Clock

memory_clock="750"

DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [gpu:0]/GPUMemoryTransferRateOffset[3]=$memory_clock
DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [gpu:1]/GPUMemoryTransferRateOffset[3]=$memory_clock
DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [gpu:2]/GPUMemoryTransferRateOffset[3]=$memory_clock
DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [gpu:3]/GPUMemoryTransferRateOffset[3]=$memory_clock

exit 0