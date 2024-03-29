# boot-script

Table of contents:

  - [What is this?](https://github.com/Moneymoney122/boot-script#what-is-this) 
   - [Credits](https://github.com/Moneymoney122/boot-script#credits)
     - [How to use this script](https://github.com/Moneymoney122/boot-script#how-to-use-this-script)
        - [Arguments available on this script](https://github.com/Moneymoney122/boot-script#arguments-available-on-this-script)
     - [Dependencies for this script](https://github.com/Moneymoney122/boot-script#dependencies-for-this-script)
      - [Issues/Contact Me](https://github.com/Moneymoney122/boot-script#issuescontact-me)
       - [Possible future updates](https://github.com/Moneymoney122/boot-script#possible-future-updates)
        - [Images](https://github.com/Moneymoney122/boot-script#images)
          - [Boot-script images](https://github.com/Moneymoney122/boot-script#boot-script-1)
          - [Boot-script image 1](https://github.com/Moneymoney122/boot-script#image-1)                
          - [Boot-script image 2](https://github.com/Moneymoney122/boot-script#image-2)
          - [iOS 14](https://github.com/Moneymoney122/boot-script#ios-14)
              
## What is this?

- This script is for tether booting A8/A9 devices that have been downgraded by [sunst0rm](https://github.com/mineek/sunst0rm)
  - It might work with devices that have been tethered downgraded by other tools.
  
   - Also capable of running the commands for checkra1n, running the commands for connecting via ssh to your device and saving your device's infomation to a text file
  
- I made this script for personal use, but anyone can use it

- This script is not made by mineek, it is made by me (Moneymoney122)

- It is intended for use on Linux (only tested on Arch Linux and Debian 11, but should work on every distro)

   - ~~it might work on Mac OS, but I don't know~~

    - *Update: tested on Mac OS Catalina (10.15) and it works*

- Use it at your own risk, I am not responsible for any damage it may cause.

- I have no idea why I made this script, and I have no idea if it is actually useful or not

- it may or may not work

- Released on the 1st of October 2022

- License: GPL-3.0 license

##### Proudly written in gedit

## Credits:

- Me (Moneymoney122) for making this script

- rushia (@rushia27) for helping me make this and add features to it

- Mineek for making the [sunst0rm](https://github.com/mineek/sunst0rm) script

- Credits to the other people who made the projects this scripts uses (links provided in this README.md file and on the script itself)

## How to use this script:

 - No compiling or installation necessary, just download and run it.
 
 - *if you have already downloaded this script and you want to update it, run:* `cd ~/boot-script/ && git pull`

If you do not have `git` installed then install it using your distribution's package manager, or use method two to download it.
 
 run `git clone https://github.com/Moneymoney122/boot-script` in the terminal while in your home directory or download the zip from this page and unzip the files and place them in a folder called "boot-script" (without the quotes) in your home directory

And then run:

`cd ~/boot-script/`

- main version: `chmod +x boot.sh` then `./boot.sh`

- test version: `chmod +x test-boot.sh` then `./test-boot.sh`

 - I don't really update the test version anymore, If you want the latest version with the most features use the main version.

- old version: `chmod +x old-boot.sh` then `./old-boot.sh`



- or all of them: `chmod +x *.sh` 

--------------------------------------------------------------------------

### Arguments available on this script:
| Option (short)  | Option (long)               | Description                                                        |
|-----------------|-----------------------------|--------------------------------------------------------------------|
| `-h`            | `--help`                    | Prints help options                                                |
| `-v`            | `--version`                 | Prints version information                                         |
| `-d`            | `--debug`                   | Outputs extra information (coming soon).                           |
| `-s`            | `--save`                    | Save device information to text file: ~/boot-script/deviceinfo.txt |
| `OwO`           | `OwO`                       | OwO                                                                |
| `ssh`           | `ssh`                       | ssh into your device                                               |
| No Arguments    | No Arguments                | Run normally                                                       |

*Cannot proccess more than one argument at a time at the moment*

This script will ask for your user's password, this is not intended to be anything malicious and you can check the code yourself if you want

## Dependencies for this script: 

- sunst0rm, if you want to tether downgrade your device: https://github.com/mineek/sunst0rm

    - linux fork of sunst0rm: https://github.com/MCApollo/sunst0rm

- ideviceinfo and ideviceenterrecovery: https://github.com/libimobiledevice/libimobiledevice

- libirecovery: https://github.com/libimobiledevice/libirecovery

- usbmuxd: https://github.com/libimobiledevice/usbmuxd

- ipwndfu, gaster or some other tool that is capable of putting your device in pwned dfu mode with signature checks removed

  - fork of ipwndfu for A8/A9 devices: https://github.com/exploit3dguy/ipwndfu
    
   - python2 is required for ipwndfu
   
   - gaster: https://github.com/0x7ff/gaster
  
     - if you're using gaster please ensure that you have compiled gaster: 
    
        Linux: `cd ~/gaster/ && make libusb` 
    
        MacOS: `cd ~/gaster/ && make` 
    
       After that you should see a gaster executable in the gaster folder, if you get "bash: ./gaster: Permission denied" then run `chmod +x gaster` and try again

    - if you use any other tool than ipwndfu/gaster then you will need to pwn your device with sigchecks removed and then run the script and when you get to the pwning part of the script you will need to enter the option "already pwned" 

- if you want to get checkra1n: https://checkra.in

- sshpass is required if you're going to use the ssh feature of this script

- sudo

- git

- awk

- lolcat

- hostnamectl

- lsb-release

- some features of this script requires a system with systemd

- not recommended to run it as root

- if you run it as root, not recommended, but if you do and you get this error or some similar error:

```
james@moneymoney122-hp-compaq-nc6000:~/boot-script$ sudo ./boot.sh 
./boot.sh: 33: Syntax error: "(" unexpected
james@moneymoney122-hp-compaq-nc6000:~/boot-script$
```

then run `sudo bash ./boot.sh` instead

## Issues/Contact Me:

- Current issues: none

- ~~update the list of checkm8 incompatible devices to list checkm8 compatible devices instead so that I don't have to update the list everytime Apple releases new devices~~ - done

- If you have any issues with this script or any of my other projects, please open a github issue or contact me on twitter (@chandler_hacker) or contact me using the email on my profile

## Possible future updates:

- ~~None at the moment, I am open to ideas on what to add.~~

- planning on making a version of this script written in python

- This script is constantly being updated with new features.

## Images:

*Images shown may vary from the latest version of the script.*

### boot-script:

### image 1:

- start of script

![This is an image](https://i.imgur.com/PoFYstf.png)

### image 2:

- main menu

![This is an image](https://i.imgur.com/wyDM1jL.jpg)

### image 3:

- ssh

![This is an image](https://i.imgur.com/G8xCyKt.jpg)

### iOS 14:

- iOS 14

![This is an image](https://images.idgesg.net/images/article/2020/06/ios14-logo-100849580-large.3x2.jpg)

