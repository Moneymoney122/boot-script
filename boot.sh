#!/usr/bin/env bash

clear
ICyan='\033[0;96m'
echo -e "${ICyan}Boot script for tethered downgraded A8/A9 devices, this script is made by Moneymoney122 (@chandler_hacker on twitter)"
echo "---------------------------------------------------------------------------------------------------------------------"
echo "this script is a modified version of the boot script from the sunst0rm tether downgrade tool made by mineek (https://github.com/mineek/sunst0rm)"
echo "---------------------------------------------------------------------------------------------------------------------"
echo "verbose output is enabled by default in this script, so you will see a lot of text in the terminal"
echo "---------------------------------------------------------------------------------------------------------------------"
echo "this script will also ask for your user's password, it is completly safe and you can check the code if you want to be sure"
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

read -n 1 -s -r -p "Press any key to continue"

clear

echo 'Please put your device in DFU mode (hold the power buttom and home button for 10 seconds and then release the power button but keep holding the home button for another 10 seconds.) now, and make sure you are curently in the directory where the boot files are stored'

echo "---------------------------------------------------------------------------------------------------------------------"

while true; do
    read -p 'If your device is currenlty in normal mode and you want to reboot it, this script can enter recovery mode (it will be a black screen but it will be in recovery mode.) for you and then you can enter DFU mode from there, this is a safer option if your device is already in normal mode. Is your device is currenlty in normal mode? yes/no: ' input
    case $input in
        [yY]*)
            echo 'Entering recovery mode...'

var=`ideviceinfo | grep "UniqueDeviceID" | grep -wv "UniqueDeviceID: "`

sudo ideviceenterrecovery $var

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

echo "if you chose to put your device into recovery mode from normal mode, please now put your device into DFU mode and type yes when your device is in DFU mode"
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

echo "Assuming the ipwndfu folder is in the home directory and that python2 is installed..."

while true; do
    read -p 'Is this correct? yes/no: ' input
    case $input in
        [yY]*)
            echo 'Continuing the script...'
            break
            ;;
        [nN]*)
            echo "Please copy the ipwdnfu folder into your home directory and install python2 and then restart your device and the script"
            echo 'Exiting...'
            exit 1
            ;;
         *)
            echo 'Invalid input' >&2
    esac
done

echo "Running the commands for ipwndfu A8/A9..."

cd ~/ipwndfu/

sudo python2.7 ./ipwndfu -p --rmsigchecks

cd -

while true; do
    read -p 'did ipwndfu work succefully? If it did not then please type no and then please force restart your device and put it back into DFU mode and then run the script again, or if you just want to put your device into PwnedDFU mode with sigchecks removed then you can type no and exit the script too. if it did then please type yes. yes/no: ' input
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
