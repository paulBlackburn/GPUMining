#Overclocks GPUs
sudo nvidia-smi -pm ENABLED

sudo nvidia-smi -i 0, -pl 90
sudo nvidia-smi -i 1, -pl 90
sudo nvidia-smi -i 2, -pl 90
sudo nvidia-smi -i 3, -pl 90

DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [gpu:0]/GPUPowerMizerMode=1
DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [gpu:1]/GPUPowerMizerMode=1
DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [gpu:2]/GPUPowerMizerMode=1
DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [gpu:3]/GPUPowerMizerMode=1

DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [gpu:0]/GPUGraphicsClockOffset[3]=0
DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [gpu:1]/GPUGraphicsClockOffset[3]=0
DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [gpu:2]/GPUGraphicsClockOffset[3]=0
DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [gpu:3]/GPUGraphicsClockOffset[3]=0

DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [gpu:0]/GPUMemoryTransferRateOffset[3]=1000
DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [gpu:1]/GPUMemoryTransferRateOffset[3]=1000
DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [gpu:2]/GPUMemoryTransferRateOffset[3]=1000
DISPLAY=:0 XAUTHORITY=/var/lib/mdm/:0.Xauth nvidia-settings -a [gpu:3]/GPUMemoryTransferRateOffset[3]=1000