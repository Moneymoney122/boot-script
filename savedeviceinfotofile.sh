#!/usr/bin/env bash

#script to get basic or all infomation of a device and save it to a file

#colours
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
CYAN="\033[0;36m"
NC="\e[0m"
ICyan='\033[0;96m'
IGreen='\033[0;92m'

#Background
On_Black='\033[40m'

echo -e "${ICyan}Device infomation will be saved to deviceinfo.txt in the boot-script directory.\nPlease ensure your device is connected to your computer.\n"

while true; do
read -p 'Do you want to save just basic info to the file or all info? (Or press Ctrl+C to cancel and exit). B/A: ' INPUT

    case $INPUT in
        [bB]*)
       
#get device info

ActivationState=$(ideviceinfo | grep ActivationState: | awk '{print $NF}')
DeviceName=$(ideviceinfo | grep DeviceName | awk '{print $NF}')
UniqueDeviceID=$(ideviceinfo | grep UniqueDeviceID | awk '{print $NF}')
SerialNumber=$(ideviceinfo | grep -w SerialNumber | awk '{print $NF}')
ProductType=$(ideviceinfo | grep ProductType | awk '{print $NF}')
ProductVersion=$(ideviceinfo | grep ProductVersion | awk '{print $NF}')
UniqueChipID=$(ideviceinfo | grep UniqueChipID | awk '{print $NF}')
HardwareModel=$(ideviceinfo | grep HardwareModel | awk '{print $NF}')
CPUArchitecture=$(ideviceinfo | grep CPUArchitecture | awk '{print $NF}')
HardwarePlatform=$(ideviceinfo | grep HardwarePlatform | awk '{print $NF}')

Hex=$(printf '%x\n' $UniqueChipID)

#save device info to file

touch ~/boot-script/deviceinfo.txt

echo "Activation State: $ActivationState Name: $DeviceName UDID: $UniqueDeviceID Serial Number: $SerialNumber iOS Version: $ProductVersion ECID (Decimal/Hexadecimal): $UniqueChipID / $Hex Model: $HardwareModel CPU Architecture: $CPUArchitecture Hardware Platform: $HardwarePlatform" > ~/boot-script/deviceinfo.txt

echo "Done, your device infomation text file is located at ~/boot-script/deviceinfo.txt" 

exit
            ;;
        [aA]*)

#get device info 

Deviceinfo=$(ideviceinfo)
            
touch ~/boot-script/deviceinfo.txt

#save device info to file

echo $Deviceinfo > ~/boot-script/deviceinfo.txt

echo "Done, your device infomation text file is located at ~/boot-script/deviceinfo.txt"

exit
            ;;
         *)
            echo 'Invalid input' >&2
    esac
done
