#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.

#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.

#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <https://www.gnu.org/licenses/>.

#start of script

#!/usr/bin/env bash

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

# trap ctrl-c and call ctrl_c()
trap ctrl_c INT

function ctrl_c() {
        echo -e "$ICyan\nExiting...$NC"
        exit 1
}


linelength=$(tput lines)

if [[ $linelength == 24 ]]; then

line_length="-------------------------------------------------------------------------------"

else

 if [[ $linelength -gt 24 ]]; then

 line_length="---------------------------------------------------------------------------------------------------------------------"

 else

 line_length="-----------------------------------------------------------"

 fi

fi

usage="Boot script by Moneymoney122 (@chandler_hacker)\nhttps://github.com/Moneymoney122/boot-script\n\nOptions:\n-h or --help or an invalid option: display this help menu\nOwO: OwO\nNo arguments: run normally\nssh: ssh into a root shell for your device, your device must be jailbroken and have OpenSSH installed.${NC}"

#check terminal size

terminallines=$(tput lines)
terminalcols=$(tput cols)

if [[ $terminallines -ge 24 ]]; then

echo "" > /dev/null

else

echo -e "${ICyan}Terminal size is ${terminallines}x${terminalcols}, it is recommended that you make you make your terminal larger."

sleep 3

terminalwarningsent=yes

fi

if [[ $terminalcols -ge 80 ]]; then

echo "" > /dev/null

else

if test -z "$terminalwarningsent"

then

echo -e "${ICyan}Terminal size is ${terminallines}x${terminalcols}, it is recommended that you make you make your terminal larger."

fi

sleep 3

fi

case $1 in 
OwO) echo -e "${ICyan}OwO${NC}" && exit ;;
ssh)
echo -e "${ICyan} $line_length"
echo -e "ssh into a root shell for your device, your device must be jailbroken and have OpenSSH installed.\nYour device and computer must be on the same WiFi network,\nand there must not be anything stopping your devices from connecting to each other.\nThe default password for your device if you have not changed it is: alpine.\nEnter your device's local IP Address.\nYou can find this in Settings > WiFi > Click on your WiFi Network and scroll down and find your local IP Address.\nWhen you have finished in the shell type \"exit\" or \"logout\".\nRemember, you are logging in as root, the most powerfull user and it can be dangerous if you don't know what you're doing.\nProcceed at your own risk, I am not responsible for any damage you may cause. To exit at anytime press Ctrl+C.\nWhen entering your password it will be hidden but will still be registered."
echo "line_length"
echo "Checking Internet connection..." 
    ping -c 3 208.67.222.222 >/dev/null 2>/dev/null
    if [[ $? != 0 ]]; then
   
   echo "No internet connection."
   
   echo "You might encounter issues sshing into your device."
   echo "$line_length"
    else
       echo -e "You have an internet connection."
       echo "$line_length"
   fi

read -p "Enter local IP Address: " IPADDRESS
read -sp "Enter Password: " PASSWORD
echo -e "${NC}"
sudo sshpass -v -p "$PASSWORD" ssh root@$IPADDRESS
exit ;;
-h)
echo -e "$ICyan ___  ___   ___ _____   ___  ___ ___ ___ ___ _____ " | lolcat -p 0.1
echo         "| _ )/ _ \ / _ \_   _| / __|/ __| _ \_ _| _ \_   _| " | lolcat -p 0.1
echo         "| _ \ (_) | (_) || |   \__ \ (__|   /| ||  _/ | |  "  | lolcat -p 0.1
echo -e      "|___/\___/ \___/ |_|   |___/\___|_|_\___|_|   |_|  \n" | lolcat -p 0.1
echo -e  "${ICyan}$usage"
exit ;;
--help)
echo -e "$ICyan ___  ___   ___ _____   ___  ___ ___ ___ ___ _____ " | lolcat -p 0.1
echo         "| _ )/ _ \ / _ \_   _| / __|/ __| _ \_ _| _ \_   _| " | lolcat -p 0.1
echo         "| _ \ (_) | (_) || |   \__ \ (__|   /| ||  _/ | |  "  | lolcat -p 0.1
echo -e      "|___/\___/ \___/ |_|   |___/\___|_|_\___|_|   |_|  \n" | lolcat -p 0.1
echo -e  "${ICyan}$usage"
exit ;;
esac


if test -z "$1"

then

echo "" > /dev/null

else

echo -e "${ICyan}Invalid option: \"$1\""

echo -e "$ICyan ___  ___   ___ _____   ___  ___ ___ ___ ___ _____ " | lolcat -p 0.1
echo         "| _ )/ _ \ / _ \_   _| / __|/ __| _ \_ _| _ \_   _| " | lolcat -p 0.1
echo         "| _ \ (_) | (_) || |   \__ \ (__|   /| ||  _/ | |  "  | lolcat -p 0.1
echo -e      "|___/\___/ \___/ |_|   |___/\___|_|_\___|_|   |_|  \n" | lolcat -p 0.1
echo -e  "${ICyan}$usage"
exit

fi

clear 

echo -e "$ICyan ____   ____   ____ _______    _____  _____ _____  _____ _____ _______" 
echo          "|  _ \ / __ \ / __ \__   __|  / ____|/ ____|  __ \|_   _|  __ \__   __|"
echo          "| |_) | |  | | |  | | | |    | (___ | |    | |__) | | | | |__) | | |   "
echo          "|  _ <| |  | | |  | | | |     \___ \| |    |  _  /  | | |  ___/  | |   "
echo          "| |_) | |__| | |__| | | |     ____) | |____| | \ \ _| |_| |      | |   "
echo          "|____/ \____/ \____/  |_|    |_____/ \_____|_|  \_\_____|_|      |_|   "

echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n"

echo  " _ __  ___ _____ __ __ "
echo  "| '  \/ -_) _ \ V  V /"
echo  "|_|_|_\___\___/\_/\_/ "
                            
sleep 1.5

clear

echo "$line_length"
echo "Boot script for tethered downgraded A8/A9 devices, this script is made by Moneymoney122 (@chandler_hacker on twitter)."
echo "$line_length"
echo "this script is a modified version of the boot script from the sunst0rm tether downgrade tool made by mineek. (https://github.com/mineek/sunst0rm)"
echo "$line_length"
echo "verbose output is enabled by default in this script, so you will see a lot of text in the terminal."
echo "$line_length"
echo "this script will also ask for your user's password, it is completly safe and you can check the code if you want to be sure."
echo "$line_length"
echo "if you have any issues with this script please read the README.md file included with this script or on the github repo before opening an issue on github or contacting me."
echo "$line_length"
echo "if you see any commands in quotes and you want to run them then please copy the commands without the quotes and then run them."
echo "$line_length"
echo "this script will be changing directory into the folder with your boot files, please change this command to match the name of the folder with your boot files by opening this script with a text editor and editing the command on line 506, if you have not already."
echo "$line_length"
echo "please ensure that the ipwndfu and gaster folders are in the home directory and that python2 is installed before continuing,"
echo "$line_length"
echo "if your device is in DFU mode at any time and you want to exit it, hold the power button and home button for 15 seconds."
echo "$line_length"
echo "it is reccomended that you maximise your terminal window to ensure all text is displayed correctly."
echo "$line_length"
echo "you can use Ctrl+C to exit the script at any time."
echo "$line_length"
echo "this script can also run checkra1n commands to jailbreak your device for any checkra1n compatible device. if you want to use checkra1n with this script please ensure that the checkra1n executable file is in your home directory (get checkra1n at https://checkra.in)"
echo "$line_length"

read -n 1 -s -r -p "----------------Press any key to continue (Or Ctrl+C to Exit)---------------"

clear

if [[ $EUID == 0 ]]; then
        while true; do
    read -p 'The script is currently running as root, (If this message is incorrect then you can just ignore it and type yes.) this is not recommended but you can still continue if you want? yes/no: ' input
    case $input in
        [yY]*)
            echo 'Continuing the script...'
            break
            ;;
        [nN]*)
            echo 'Exiting...'
            exit 1
            ;;
         *)
            echo 'Invalid input' >&2
    esac
done
fi

clear

name=$(whoami)

date=$(date "+%A, %d %B %Y %H:%M:%S")

  hour=$(date +%H)
  greet="It's"

  if [ $hour -le 11 ] && [ $hour -gt 6 ]; then
    timeofday=morning
  elif [ $hour -eq 12 ]; then
    timeofday=noon
  elif [ $hour -le 17 ] && [ $hour -gt 12 ]; then
    timeofday=afternoon
  elif [ $hour -le 19 ] && [ $hour -gt 17 ]; then
    timeofday=evening
  else
    timeofday=night
  fi

echo "$line_length"

echo -e "${On_Black}Welcome $name, $greet $timeofday. The current date and time is: $date${NC}" | lolcat  -a -d 60  

echo -e "${ICyan} $line_length"

echo "Detecting what Operating System and Hardware this script is running on..."

echo "$line_length"

case "$OSTYPE" in
  solaris*) echo "Running on Solaris" ;;
  darwin*)  echo "Running on Mac OS/iOS/iPad OS" ;; 
  linux*)   echo "Running on Linux" ;;
  bsd*)     echo "Running on BSD" ;;
  msys*)    echo "Running on Windows" ;;
  cygwin*)  echo "Running on Windows" ;;
  *)        echo "Unknown: $OSTYPE" ;;
esac

lowercase(){
    echo "$1" | sed "y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/"
}

HardwareModel=$(hostnamectl | grep "Hardware Model")

if test -z "$HardwareModel" 

then

sudo /usr/sbin/dmidecode -s system-product-name

else 

echo $HardwareModel

fi

OSNAME=$(lsb_release -d | cut -f 2-)

if [[ $OSNAME == "Arch Linux" ]]; then

echo "You use Arch Linux btw"

echo $OSNAME

else

echo "You do not use Arch Linux btw"

echo $OSNAME

fi

OS=`lowercase \`uname\``
KERNEL=`uname -r`
MACH=`uname -m`

if [ "{$OS}" == "windowsnt" ]; then
    OS=windows
elif [ "{$OS}" == "darwin" ]; then
    OS=mac
else
    OS=`uname`
    if [ "${OS}" = "SunOS" ] ; then
        OS=Solaris
        ARCH=`uname -p`
        OSSTR="${OS} ${REV}(${ARCH} `uname -v`)"
    elif [ "${OS}" = "AIX" ] ; then
        OSSTR="${OS} `oslevel` (`oslevel -r`)"
    elif [ "${OS}" = "Linux" ] ; then
        if [ -f /etc/redhat-release ] ; then
            DistroBasedOn='RedHat'
            DIST=`cat /etc/redhat-release |sed s/\ release.*//`
            PSUEDONAME=`cat /etc/redhat-release | sed s/.*\(// | sed s/\)//`
            REV=`cat /etc/redhat-release | sed s/.*release\ // | sed s/\ .*//`
        elif [ -f /etc/SuSE-release ] ; then
            DistroBasedOn='SuSe'
            PSUEDONAME=`cat /etc/SuSE-release | tr "\n" ' '| sed s/VERSION.*//`
            REV=`cat /etc/SuSE-release | tr "\n" ' ' | sed s/.*=\ //`
        elif [ -f /etc/mandrake-release ] ; then
            DistroBasedOn='Mandrake'
            PSUEDONAME=`cat /etc/mandrake-release | sed s/.*\(// | sed s/\)//`
            REV=`cat /etc/mandrake-release | sed s/.*release\ // | sed s/\ .*//`
        elif [ -f /etc/debian_version ] ; then
            DistroBasedOn='Debian'
            DIST=`cat /etc/lsb-release 2>/dev/null | grep '^DISTRIB_ID' | awk -F=  '{ print $2 }'`
            PSUEDONAME=`cat /etc/lsb-release 2>/dev/null | grep '^DISTRIB_CODENAME' | awk -F=  '{ print $2 }'`
            REV=`cat /etc/lsb-release 2>/dev/null | grep '^DISTRIB_RELEASE' | awk -F=  '{ print $2 }'`
        fi
        if [ -f /etc/UnitedLinux-release ] ; then
            DIST="${DIST}[`cat /etc/UnitedLinux-release | tr "\n" ' ' | sed s/VERSION.*//`]"
        fi
        OS=`lowercase $OS`
        DistroBasedOn=`lowercase $DistroBasedOn`
        readonly OS
        readonly DIST
        readonly DistroBasedOn
        readonly PSUEDONAME
        readonly REV
        readonly KERNEL
        readonly MACH
    fi

fi
echo $OS
echo $KERNEL
echo $MACH

    if [[ $(uname -m) != "x86_64" ]]; then
      echo "$line_length"
      echo "Non x86_64 system detected, you might encounter issues"
    fi


echo "$line_length"

echo "Please connect your device now..."

sleep 3

echo "$line_length"

echo "Searching for devices in normal mode..."

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

if test -z "$ActivationState"

then
  
    echo "$line_length"
  
    echo -e "$RED*******unable to connect to any devices in normal mode*******$NC"

    echo -e "$ICyan $line_length"
   
    echo "Searching for devices in DFU/Recovery mode..."
    
    devicemode=$(irecovery -q 2>/dev/null | grep MODE: | awk '{print $NF}')

    echo -e "$line_length $IGreen"

    if test -z "$devicemode"
  
    then

    echo -e "$RED*******unable to connect to any devices in Recovery/DFU mode*******$ICyan"

echo "$line_length"

while true; do
    read -p 'No devices have been detected, do you want to restart usbmuxd? (this might fix your computer not detecting your device in normal mode). (If this message is incorrect then you can just ignore it and type no.) yes/no: ' input
    case $input in
       [yY]*)
            echo 'Continuing the script...'
            echo -e "Running \"sudo systemctl restart usbmuxd\", this might take a while..."
            T="$(date +%s)"
            sudo systemctl restart usbmuxd
            T="$(($(date +%s)-T))"
            echo "Completed, It took ${T} seconds."
            echo "$line_length"
            echo "Please disconnect and reconnect your device..."
            for i in {1..3}
            do
            sleep 1
            echo -n "$i "
            done

echo -e "\n $line_length"

echo "Searching for devices in normal mode..."

sleep 1

unset ActivationState
unset DeviceName
unset UniqueDeviceID
unset SerialNumber
unset ProductType
unset ProductVersion
unset UniqueChipID
unset HardwareModel
unset CPUArchitecture
unset HardwarePlatform

sleep 1

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

if test -z "$ActivationState"

then

echo "$line_length"   
echo -e "$RED*******still unable to connect to any devices in normal mode*******$ICyan" 
echo "$line_length" 
while true; do
    read -p 'Do you still want to continue? yes/no: ' input
    case $input in
        [yY]*)
           echo 'Continuing the script...'
           break
            ;;
        [nN]*)
echo "Please run the script again"
            echo 'Exiting...'
            exit 1
            ;;
         *)
            echo 'Invalid input' >&2
    esac
done

else             
      
      echo "$line_length"     
      echo "Device found in normal mode"
      echo "$line_length"
      echo -e "${IGreen}Serial Number: $SerialNumber | Device: $ProductType | Firmware: $ProductVersion | UDID: $UniqueDeviceID\n"
      echo "Name: $DeviceName | Activation State: $ActivationState | ECID (Decimal): $UniqueChipID | Board ID: $HardwareModel"
      echo -e "\nCPU Arch: $CPUArchitecture | Hardware Platform: $HardwarePlatform"  

fi            
            break
            ;;
        [nN]*)
            echo 'Skipping...'
            break
            ;;
            *)
         echo 'Invalid input' >&2
    esac
done

else

    irecovery -q
  
    fi

else
      echo "$line_length"
      echo -e "${IGreen}Serial Number: $SerialNumber | Device: $ProductType | Firmware: $ProductVersion | UDID: $UniqueDeviceID\n"
      echo "Name: $DeviceName | Activation State: $ActivationState | ECID (Decimal): $UniqueChipID | Board ID: $HardwareModel"
      echo -e "\nCPU Arch: $CPUArchitecture | Hardware Platform: $HardwarePlatform"
      echo -e "$ICyan $line_length"
      echo "Device found in normal mode, not going to search for devices in DFU/Recovery mode."

#why did i write this all out manually...

ProductType=$(ideviceinfo | grep ProductType | awk '{print $NF}')

if [[ $ProductType == iPhone1,1 || $ProductType ==  iPhone1,2 || $ProductType == iPhone2,1 || $ProductType == iPhone3,1 || $ProductType == iPhone3,2 || $ProductType == iPhone3,3 || $ProductType == iPhone11,8 || $ProductType == iPhone11,2 || $ProductType == iPhone11,4 || $ProductType == iPhone11,6 || $ProductType == iPhone12,1 || $ProductType == iPhone12,3 || $ProductType == iPhone12,5 || $ProductType == iPhone12,8 || $ProductType == iPhone13,1 || $ProductType == iPhone13,2 || $ProductType == iPhone13,3 || $ProductType == iPhone13,4 || $ProductType == iPhone14,4 || $ProductType == iPhone14,5 || i$ProductType == Phone14,2 || $ProductType == iPhone14,3 || i$ProductType == Phone14,6 || $ProductType == iPhone14,7 || $ProductType == iPhone14,8 || $ProductType == iPhone15,2 || $ProductType == iPhone15,3 || $ProductType == iPod1,1 || $ProductType == iPod2,1 || $ProductType == iPod3,1 || $ProductType == iPod4,1 || $ProductType == iPad1,1 || $ProductType == iPad11,6 || $ProductType == iPad11,7 || $ProductType == iPad12,1 || $ProductType == iPad12,2 || $ProductType == iPad8,1 || $ProductType == iPad8,2 || $ProductType == iPad8,3 || $ProductType == iPad8,4 || $ProductType == iPad8,5 || $ProductType == iPad8,6 || $ProductType == iPad8,7 || $ProductType == iPad8,8 || $ProductType == iPad8,9 || $ProductType == iPad8,10 || $ProductType == iPad8,11 || $ProductType == iPad8,12 || $ProductType == iPad13,4 || $ProductType == iPad13,5 || $ProductType == iPad13,6 || $ProductType == iPad13,7 || $ProductType == iPad13,8 || $ProductType == iPad13,9 || $ProductType == iPad13,10 || $ProductType == iPad13,11 || $ProductType == iPad11,3 || $ProductType == iPad11,4 || $ProductType == iPad13,1 || $ProductType == iPad13,2 || $ProductType == iPad13,16 || $ProductType == iPad13,17 || $ProductType == iPad11,1 || $ProductType == iPad11,2 || $ProductType == iPad14,1 || $ProductType == iPad14,2 ]]; then

echo "$line_length" 

echo -e "${YELLOW}checkm8 incompatible device detected, you won't be able to use parts of this script that require checkm8 to be used. Your device may be compatible with other BootROM exploits, please check online${ICyan}"

checkm8compatible=no

else 

echo "$line_length" 

echo -e "${YELLOW}Your device is compatible with checkm8${ICyan}"

checkm8compatible=yes

fi

fi

echo -e "$ICyan $line_length"

    echo "Checking Internet connection... (You don't need an internet connection for this script, I'm just checking becuase I can lmao)" 
    ping -c 3 208.67.222.222 >/dev/null 2>/dev/null
    if [[ $? != 0 ]]; then
       echo "No internet connection."

    else

       echo "You have an internet connection."
    fi

echo "$line_length"

while true; do
    read -p 'Do you want to jailbreak with checkra1n? yes/no: ' input
    case $input in
        [yY]*)

while true; do
    read -p 'Do you want to run checkra1n in GUI or CLI mode (if your device is in DFU mode you will need to run checkra1n in CLI mode)? g/c: ' input
    case $input in
        [c]*)
           read -p "Do you want to add any arguments to checkra1n? if yes then please type them here, if you don't know what these are or you don't want to add any then just press enter to leave this blank: " ARGUMENTS
           echo -e "Running checkra1n in CLI mode. Please ensure your device is in DFU mode and that the checkra1n executable is in your home directory..."
           echo "When checkra1n has finished please press Ctrl+C to exit checkra1n and exit this script" 
           echo "$line_length"
           echo "Searching for devices in DFU/Recovery mode..."
           sudo irecovery -q
           echo "$line_length"
           echo -e "${NC}"
           sudo ~/checkra1n -c $ARGUMENTS
           break
            ;;
        [g]*)
           echo "$line_length"   
           read -p "Do you want to add any arguments to checkra1n? if yes then please type them here, if you don't know what these are or you don't want to add any then just press enter to leave this blank: " ARGUMENTS
           echo -e "Running checkra1n in GUI mode. Please ensure your device is in normal or recovery mode and that the checkra1n executable is in your home directory..."
           echo -e "When checkra1n has finished it should exit automatically and then the script will return to the jailbreak with checkra1n option\nso you can run checkra1n again if it failed or if you want to run it again, if it did not exit automatically then please press Ctrl+C to exit checkra1n and exit this script and then you can run the script again if you want to."
           echo "$line_length"
           read -n 1 -s -r -p "--------------Press any key to start checkra1n or Ctrl+C to Exit-----------"        
           echo -e "$NC"
           sudo ~/checkra1n $ARGUMENTS
           echo -e "$ICyan"
           break
            ;;
         *)
            echo 'Invalid input' >&2
    esac
done
            ;;
        [nN]*)
            echo "Skipping..."
            sleep 3
            clear
            break
            ;;
         *)
            echo 'Invalid input' >&2
    esac
done

#cd into the folder with your boot files, change this command to cd into the folder with your boot files  
echo -e "${ICyan} $line_length"
echo "Changing into the folder with your boot files..."
cd ~/sunst0rm/boot-ixbugnoe/
pwd

echo "$line_length"

while true; do
    read -p 'If your device is currently in normal mode and you want to reboot it, this script can enter recovery mode (it will be a black screen but it will be in recovery mode.) for you and then you can enter DFU mode from there, this is a safer option if your device is already in normal mode. Is your device is currently in normal mode? yes/no: ' input
    case $input in
        [yY]*)
            echo 'Entering recovery mode...'

var=`ideviceinfo | grep "UniqueDeviceID" | grep -wv "UniqueDeviceID: "`

sudo ideviceenterrecovery $var

echo "$line_length"

sleep 7

while true; do
    read -p 'Did your device enter recovery mode (black screen if your device is tether downgraded) from normal mode? yes/no: ' input
    case $input in
        [yY]*)
            echo 'Continuing the script...'
            break
            ;;
        [nN]*)
            
echo "$line_length"
echo "if you device did not enter recovery mode (black screen if your device is tether downgraded) from normal mode then your device probably was not detected by the computer, you could try to run \"sudo systemctl restart usbmuxd\" in the terminal to restart usbmuxd and then try running the script again or if that fails then you could try to run sudo \"systemctl stop usbmuxd\" and then \"sudo usbmuxd -p -f\" or you could put your device into DFU mode manually, if you want to do that please power off your device and then power it back on by holding the power button like normal but you will see a black screen until you have tether booted your device if your device is tether downgraded and then run the script again until you reach the entering DFU mode tutorial (input no when asked if you want to enter recovery mode from normal mode) and then follow the tutorial to enter DFU mode"
echo "$line_length"

echo 'Exiting...'
            exit 1
            ;;
         *)
            echo 'Invalid input' >&2
    esac
done
            break
            ;;
        [nN]*)
            echo 'Skipping...'
            break
            ;;
         *)
            echo 'Invalid input' >&2
    esac
done

clear

echo "$line_length"
echo -e "${ICyan}if you chose to put your device into recovery mode from normal mode, please now put your device into DFU mode"
echo "$line_length"
echo "Please make sure your device is in DFU mode now, and make sure you are curently in the directory where the boot files are stored"
  read -p 'Do you want help entering DFU mode? yes/no: ' input
    case $input in
        [yY]*)
            echo 'Continuing to the entering DFU tutorial...'

echo "Get ready to hold the power button and home button for 10 seconds..."

for i in {1..3}
do
    sleep 1
    echo -n "$i "
done

echo -e "\nHold the power button and home button for 10 seconds..."

for i in {1..10}
do
    sleep 1
    echo -n "$i "
done

echo -e "\nRelease the power button without releasing the home button and continue to hold the home button for another 10 seconds..."

for i in {1..10}
do
    sleep 1
    echo -n "$i "
done

echo -e "\nYour device should now be in DFU mode"

echo "$line_length"

sudo irecovery -q
      
echo "$line_length"

echo "If you see [MODE]:DFU in the text above it means your device is successfully in DFU mode, if you do not see that it could mean your device is not in DFU mode or you computer is having trouble detecting it."
            ;;
        [nN]*)
            echo 'Skipping...'
            ;;
         *)
            echo 'Invalid input' >&2
    esac

echo "$line_length"

while true; do
    read -p 'Is your device in DFU/Recovery mode now? yes/no: ' input
    case $input in
        [yY]*)
           echo 'Continuing the script...'
           echo "$line_length"
           echo "Searching for devices in DFU/Recovery mode..."
           echo "$line_length"
           sudo irecovery -q
           break
            ;;
        [nN]*)
echo "Please run the script again"
            echo 'Exiting...'
            exit 1
            ;;
         *)
            echo 'Invalid input' >&2
    esac
done

echo "$line_length"

while true; do
    read -p 'Do you want to use ipwndfu or gaster to pwn your device, or is your device already done being pwned? i/g/d: ' input
    case $input in
        [i]*)

echo "Changing into the ipwndfu directory..."

cd ~/ipwndfu/

echo "Running the commands for ipwndfu A8/A9..."

sudo python2.7 ./ipwndfu -p --rmsigchecks

echo "$line_length"

echo "Changing back into the directory with the boot files..."

cd -

echo "$line_length"

while true; do
    read -p 'did you get the "ValueError: The device has no langid" error, if you did this can usually be fixed by running ipwndfu again without restarting your device, or you can use this as an opportunity to force restart your device and put it back into DFU mode and then run ipwndfu again if it failed with an error other than "ValueError: The device has no langid" without having to run the script again. yes/no: ' input
    case $input in
        [yY]*)
            echo 'Running ipwndfu again...'
echo "Changing into the ipwndfu directory..."

cd ~/ipwndfu/

echo "Running the commands for ipwndfu A8/A9..."

sudo python2.7 ./ipwndfu -p --rmsigchecks

echo "$line_length"

echo "Changing back into the directory with the boot files..."

cd -

    break
            ;;
        [nN]*)
            echo 'Skipping...'
            break
            ;;
         *)
            echo 'Invalid input' >&2

   esac
done        
          break
          ;;
        [g]*) 
cd ~/gaster/

echo "Running the commands for gaster..."

./gaster pwn

echo "Changing back into the directory with the boot files..."

cd -          
          break
          ;;
          [d]*)
echo "Skipping pwning your device..."
          break
          ;;
         *)
            echo 'Invalid input' >&2
   esac
done

echo "$line_length"

while true; do
    read -p 'Did ipwndfu/gaster work succefully? If it did not then please type no and then please force restart your device and put it back into DFU mode and then run the script again, if one tool failed you can try the other one, or if ipwndfu/gaster worked succesfully and you just want to put your device into Pwned DFU mode with sigchecks removed then you can type no and exit the script too or if you have already successfuly pwned your device and skipped pwning your device this time then type yes. if it did then please type yes. Or if you are not sure then type imunsure if you are not sure and you want to check if it worked correctly yes/no/imunsure: ' input
    case $input in
        [yY]*)
            echo 'Continuing the script...'
            break
            ;;
        [nN]*)
            echo 'Exiting...'
            exit 1
            ;;
          [imunsure]*)
       echo "$line_length"   
           sudo irecovery -q
       echo "-$line_length"
   echo "If that command prints [MODE]: DFU and [PWND]: CHECKM8/[PWND]: gaster and ipwndfu said patched mapping and signature checks or gaster said Now you can boot untrusted images. then it was successful, if it says anything different then it most likely wasn't successful and you should force restart your device run the script again."
  echo "$line_length"
          ;;
            *)
         echo 'Invalid input' >&2
    esac
done

sleep 1

echo "$line_length"

while true; do
    read -p 'Do you want to send all the files to boot your device now (easy), or do you want to choose which files to send and enable verbose mode (advanced), or have the files already been sent(s)? e/a/s: ' input
    case $input in
        [e]*)
echo "Entering easy mode..."
cpid=$(irecovery -q | grep "CPID" | sed "s/CPID: //")
sleep 1
echo "Sending iBSS..."
sudo irecovery -f ./ibss.img4
#send iBSS again.
echo "Sending iBSS again..."
sudo irecovery -f ./ibss.img4
echo "Sending iBEC..."
sudo irecovery -f ./ibec.img4
if [[ "$cpid" == *"0x80"* ]]; then
    irecovery -f ibec.img4
    sleep 2
    irecovery -c "go"
    sleep 5
fi
echo "Sending BootLogo..."
sudo irecovery -f ./bootlogo.img4
echo "Running display commands..."
sudo irecovery -c "setpicture 0"
sudo irecovery -c "bgcolor 0 0 0"
sleep 3
if [[ -f "./ramdisk.img4" ]]; then
  sudo irecovery -f ./ramdisk.img4
  sudo irecovery -c ramdisk
fi
echo "Sending DeviceTree..."
sudo irecovery -f ./devicetree.img4
echo "Running command \"devicetree\" on the device"
sudo irecovery -c devicetree
echo "Sending TrustCache..."
sudo irecovery -f ./trustcache.img4
echo "Running command \"firmware\" on the device"
sudo irecovery -c firmware
echo "Sending Kernel..."
sudo irecovery -f ./krnlboot.img4
        
echo "Files have been uploaded to your device, if you do not want to boot your device now (idk why you would not want to because this is a boot script lmao, but I'm adding the option not to anyway.) then you can use the following command to boot your device later: sudo irecovery -v -v -c bootx" 

        break
        ;;
        [a]*)
echo 'Entering advanced mode...'

echo "Searching for devices in DFU/Recovery mode..."

sudo irecovery -v -v -q

while true; do
    read -p 'Do you want to send iBSS? yes/no: ' input
    case $input in
        [yY]*)
            echo 'Sending iBSS...'
sudo irecovery -v v -f ./ibss.img4
echo "iBSS has been sent"
            break
            ;;
        [nN]*)
            
echo "Skipping sending iBSS..."
            break
            ;;
         *)
            echo 'Invalid input' >&2
    esac
done

while true; do
    read -p 'Do you want to send iBSS again? yes/no: ' input
    case $input in
        [yY]*)
            echo 'Sending iBSS again...'
sudo irecovery -v v -f ./ibss.img4
echo "iBSS has been sent twice"
            break
            ;;
        [nN]*)
            
echo "Skipping sending iBSS twice..."
            break
            ;;
         *)
            echo 'Invalid input' >&2
    esac
done

while true; do
    read -p 'Do you want to send iBEC? yes/no: ' input
    case $input in
        [yY]*)
            echo 'Sending iBEC...'
sudo irecovery -v -v -f ./ibec.img4
echo "iBEC has been sent"
           break
            ;;
        [nN]*)

echo 'Skipping sending iBEC...'
            break
            ;;
         *)
            echo 'Invalid input' >&2
   esac
done

while true; do
    read -p 'Do you want to send BootLogo? yes/no: ' input
    case $input in
        [yY]*)
            echo 'Sending BootLogo...'
sudo irecovery -v -v -f ./bootlogo.img4
echo "BootLogo has been sent"
            break
            ;;
        [nN]*)
            
echo "Skipping sending BootLogo.."

            break
            ;;
         *)
            echo 'Invalid input' >&2
   esac

done

while true; do
    read -p 'Do you want to send display commands? yes/no: ' input
    case $input in
        [yY]*)
            echo 'Sending display commands...'
sudo irecovery -v -v -f ./bootlogo.img4
echo "Sent display commands"
sudo irecovery -v -v -c "setpicture 0"	
echo "Putting some nice colours on the screen because I can..."
sleep 3
echo "Running command \"bgcolor 0 0 0\" on the device..."
sudo irecovery -v -v -c "bgcolor 0 0 0"
sleep 3
echo "Running command \"bgcolor 255 0 0\" on the device..."
sudo irecovery -v -v -c "bgcolor 255 0 0"
sleep 3
echo "Running command \"bgcolor 0 255 0\" on the device..."
sudo irecovery -v -v -c "bgcolor 0 255 0"
sleep 3
echo "Running command \"bgcolor 0 0 255\" on the device..."
sudo irecovery -v -v -c "bgcolor 0 0 255"
sleep 3
echo "Running command \"bgcolor 127 0 0\" on the device..."
sudo irecovery -v -v -c "bgcolor 127 0 0"
sleep 3
echo "Running command \"bgcolor 0 0 0\" on the device..."
sudo irecovery -v -v -c "bgcolor 0 0 0"
            break  
            ;;
        [nN]*)
            
echo 'Skipping display commands...'
            break
            ;;
         *)
            echo 'Invalid input' >&2
   esac
done

sleep 3

if [[ -f "./ramdisk.img4" ]]; then
  sudo irecovery -f ./ramdisk.img4
  sudo irecovery -c ramdisk
fi

while true; do
    read -p 'Do you want to send DeviceTree? yes/no: ' input
    case $input in
        [yY]*)
            echo 'Sending DeviceTree...'
sudo irecovery -v -v -f ./devicetree.img4
echo "Running command \"devicetree\" on the device..."
sudo irecovery -v -v -c devicetree       
            break
            ;;
        [nN]*)

echo 'Skipping Sending DeviceTree...'
            break
            ;;
         *)
            echo 'Invalid input' >&2
   esac
done            

while true; do
    read -p 'Do you want to send TrustCache? yes/no: ' input
    case $input in
        [yY]*)
echo "Sending TrustCache..."
sudo irecovery -v -v -f ./trustcache.img4
echo "Running command \"firmware\" on the device..."
sudo irecovery -v -v -c firmware
            break
            ;;
        [nN]*)

echo 'Skipping sending TrustCache...'
            break
            ;;
         *)
            echo 'Invalid input' >&2
    esac
done

while true; do
    read -p 'Do you want to send The Kernel? yes/no: ' input
    case $input in
        [yY]*)
echo "Sending Kernel..."
sudo irecovery -v -v -f ./krnlboot.img4
            break
            ;;
        [nN]*)
echo 'Skipping sending Kernel...'
            break
            ;;
         *)
            echo 'Invalid input' >&2
    esac
done
  
  ;;
  [s]*)
echo "Continuing to the boot part of this script..."
  break


    esac
done

echo "$line_length"

echo "Files have been uploaded to your device, if you do not want to boot your device now (idk why you would not want to because this is a boot script lmao, but I'm adding the option not to anyway.) then you can use the following command to boot your device later: sudo irecovery -v -v -c bootx" 

while true; do
    read -p 'Do you want to boot your device now? yes/no: ' input
    case $input in
        [yY]*)
            echo 'Booting your device...'
sudo irecovery -v -v -c bootx
 echo "Done, enjoy your tethered booted device OwO"
 echo -e "if your device failed to boot, it could have not been pwned successfully by ipwndfu or gaster, please retry ipwndfu or gaster, or if you used any other tool to pwn your device ensure that worked successfully too, or the boot files could not have been sent or not sent correctly"
            break
            ;;
        [nN]*)
            echo -e "Exiting...$NC"
            exit
            ;;
         *)
            echo 'Invalid input' >&2

   esac
done

echo "$line_length"

read -p "The script has completed. Do you want to run the script again? yes/no: "  CHECK

if [[ "$CHECK" = "Y" || "$CHECK" = "y" || "$CHECK" = "Yes" || "$CHECK" = "yes" || "$CHECK" = "YES" ]]; then

cd ~/boot-script/

bash boot.sh

else

echo -e "Exiting...$NC"
exit
fi

#end of script
