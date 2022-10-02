#!/usr/bin/env bash

clear

ICyan='\033[0;96m'
echo -e "${ICyan}---------------------------------------------------------------------------------------------------------------------"
echo "Boot script for tethered downgraded A8/A9 devices, this script is made by Moneymoney122 (@chandler_hacker on twitter)."
echo "---------------------------------------------------------------------------------------------------------------------"
echo "this script is a modified version of the boot script from the sunst0rm tether downgrade tool made by mineek. (https://github.com/mineek/sunst0rm)"
echo "---------------------------------------------------------------------------------------------------------------------"
echo "verbose output is enabled by default in this script, so you will see a lot of text in the terminal."
echo "---------------------------------------------------------------------------------------------------------------------"
echo "this script will also ask for your user's password, it is completly safe and you can check the code if you want to be sure."
echo "---------------------------------------------------------------------------------------------------------------------"

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

read -n 1 -s -r -p "------------------------------------Press any key to continue (Or Ctrl+C to Exit)------------------------------------"

clear

while true; do
    read -p 'If your device is currently in normal mode and you want to reboot it, this script can enter recovery mode (it will be a black screen but it will be in recovery mode.) for you and then you can enter DFU mode from there, this is a safer option if your device is already in normal mode. Is your device is currently in normal mode? yes/no: ' input
    case $input in
        [yY]*)
            echo 'Entering recovery mode...'

var=`ideviceinfo | grep "UniqueDeviceID" | grep -wv "UniqueDeviceID: "`

sudo ideviceenterrecovery $var


while true; do
    read -p 'Did your device enter recovery mode (black screen if your device is tether downgraded) from normal mode? yes/no: ' input
    case $input in
        [yY]*)
            echo 'Continuing the script...'
            break
            ;;
        [nN]*)
            
echo "if you device did not enter recovery mode (black screen if your device is tether downgraded) from normal mode then your device probably wasn't detected by the computer, you could try to run \"sudo systemctl restart usbmuxd\" (without the quotes) in the terminal to restart usbmuxd and then try running the script again or you could put your device into DFU mode manually, if you want to do that please power off your device and then power it back on by holding the power button like normal but you will see a black screen until you have tether booted your device if your device is tether downgraded and then run the script again until you reach the entering DFU mode tutorial (input no when asked if you want to enter recovery mode from normal mode) and then follow the tutorial to enter DFU mode"

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

sleep 3

clear

echo "---------------------------------------------------------------------------------------------------------------------"
echo "if you chose to put your device into recovery mode from normal mode, please now put your device into DFU mode"
echo "---------------------------------------------------------------------------------------------------------------------"
echo "Please make sure your device is in DFU mode now, and make sure you are curently in the directory where the boot files are stored"
  read -p 'Do you want help entering DFU mode? yes/no: ' input
    case $input in
        [yY]*)
            echo 'Continuing to the entering DFU tutorial...'
echo "Hold the power button and home button for 10 seconds..."

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

echo "---------------------------------------------------------------------------------------------------------------------"

sudo irecovery -q
      
echo "---------------------------------------------------------------------------------------------------------------------"

echo "If you see [MODE]:DFU in the text above it means your device is successfully in DFU mode, if you do not see that it could mean your device is not in DFU mode or you computer is having trouble detecting it."
            ;;
        [nN]*)
            echo 'Skipping...'
            ;;
         *)
            echo 'Invalid input' >&2
    esac

echo "---------------------------------------------------------------------------------------------------------------------"

while true; do
    read -p 'Is your device in DFU mode now, and are you also in the directory where the boot files are stored? If not then please put your device in DFU mode and cd into the directory with the boot files then run the script again, if it is then type yes. yes/no: ' input
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

echo "Assuming the ipwndfu and gaster folders is in the home directory and that python2 is installed..."

while true; do
    read -p 'Is this correct? yes/no: ' input
    case $input in
        [yY]*)
            echo 'Continuing the script...'
            break
            ;;
        [nN]*) 
           echo "Please copy the ipwndfu (if you do not have ipwndfu/gaster, well you probably do if you were able to tether downgrade your device. but if you don't then please download a version for your device that is capable of removing signature checks from your device while in DFU mode, though keep in mind that this script is made for A8/A9 devices, the one I recommend is: https://github.com/exploit3dguy/ipwndfu and gaster can be found here: https://github.com/0x7ff/gaster) folder into your home directory and install python2 (it is needed for ipwndfu, you can check if it's installed by running: python2 --version in the terminal.) and keep your device in DFU mode and restart the script"
            echo 'Exiting...'
            exit 1
            ;;
         *)
            echo 'Invalid input' >&2
    esac
done

echo "---------------------------------------------------------------------------------------------------------------------"

while true; do
    read -p 'Do you want to use ipwndfu or gaster to pwn your device? ipwndfu/gaster: ' input
    case $input in
        [ipwndfu]*)
        echo "Changing into the ipwndfu directory..."

cd ~/ipwndfu/

echo "Running the commands for ipwndfu A8/A9..."

sudo python2.7 ./ipwndfu -p --rmsigchecks

echo "Changing back into the directory with the boot files..."

cd -
            break
            ;;
        [gaster]*) 
           
 cd ~/gaster/

echo "Running the commands for gaster..."

./gaster pwn

echo "Changing back into the directory with the boot files..."

cd -          
           
          break
            ;;
         *)
            echo 'Invalid input' >&2
    esac
done

while true; do
    read -p 'Did ipwndfu/gaster work succefully? If it did not then please type no and then please force restart your device and put it back into DFU mode and then run the script again, if one tool failed you can try the other one, or if ipwndfu/gaster worked succesfully and you just want to put your device into PwnedDFU mode with sigchecks removed then you can type no and exit the script too. if it did then please type yes. Or if you are not sure then type imunsure if you are not sure and you want to check if it worked correctly yes/no/imunsure: ' input
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
          
           sudo irecovery -q
          echo "If that command prints [MODE]: DFU and [PWND]: CHECKM8/[PWND]:gaster and ipwndfu said patched mapping and signature checks or gaster said Now you can boot untrusted images. then it was successful, if it says anything different then it most likely wasn't successful and you should force restart your device run the script again."
            ;;
            *)
         echo 'Invalid input' >&2
    esac
done

sleep 1


sudo irecovery -v -v -q

sudo irecovery -f ./ibss.img4
echo "Sending iBSS again..."
sudo irecovery -v -v -f ./ibss.img4
sudo irecovery -v -v -f ./ibec.img4
sudo irecovery -v -v -f ./bootlogo.img4
sudo irecovery -v -v -c "setpicture 0"
echo "Putting some nice colours on the screen becuase I can..."
sleep 3
sudo irecovery -v -v -c "bgcolor 0 0 0"
sleep 3
sudo irecovery -v -v -c "bgcolor 255 0 0"
sleep 3
sudo irecovery -v -v -c "bgcolor 0 255 0"
sleep 3
sudo irecovery -v -v -c "bgcolor 0 0 255"
sleep 3
if [[ -f "./ramdisk.img4" ]]; then
  sudo irecovery -f ./ramdisk.img4
  sudo irecovery -c ramdisk
fi
sudo irecovery -v -v -f ./devicetree.img4
sudo irecovery -v -v -c devicetree
sudo irecovery -v -v -f ./trustcache.img4
sudo irecovery -v -v -c firmware
sudo irecovery -v -v -f ./krnlboot.img4

echo "Files have been uploaded to your device, if you do not want to boot your device now (idk why you would not want to because this is a boot script lmao, but I'm adding the option not to anyway.) then you can use the following command to boot your device later: sudo irecovery -v -v -c bootx" 

while true; do
    read -p 'Do you want to boot your device now? yes/no: ' input
    case $input in
        [yY]*)
            echo 'Booting your device...'
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

sudo irecovery -v -v -c bootx

echo "Done, enjoy your tether booted device OwO"
