#!/usr/bin/env bash

echo 'Ensure device is in pwnedDFU mode with sigchecks removed.'

echo "assuming the ipwndfu folder is in the home directory and that python2 is installed"

cd ~/ipwndfu/

sudo python2.7 ./ipwndfu -p --rmsigchecks

cd -

while true; do
    read -p 'did ipwndfu work succefully? If it did not then please type no and then please force restart your device and put it back into DFU mode and then run the script again, if did then please type yes. yes/no: ' input
    case $input in
        [yY]*)
            echo 'Continuing the script...'
            break
            ;;
        [nN]*)
            echo 'exiting...'
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
echo "Putting some nice colours on the screen becuase i can..."
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

echo "Files have been uploaded, if you do not want to boot your device now, then you can use the following command to boot your device later: sudo irecovery -v -v -c bootx" 

while true; do
    read -p 'Do you want to boot your device now? yes/no: ' input
    case $input in
        [yY]*)
            echo 'Booting your device...'
            break
            ;;
        [nN]*)
            echo 'exiting...'
            exit 1
            ;;
         *)
            echo 'Invalid input' >&2
    esac
done

sudo irecovery -v -v -c bootx

echo "Done"
