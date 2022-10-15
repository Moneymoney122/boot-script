# boot-script

Table of contents:

 - [What is this?](https://github.com/Moneymoney122/boot-script#what-is-this) 
   - [Credits](https://github.com/Moneymoney122/boot-script#credits)
     - [How to use this script](https://github.com/Moneymoney122/boot-script#how-to-use-this-script)
       - [Dependencies for this script](https://github.com/Moneymoney122/boot-script#dependencies-for-this-script)
         - [Issues/Contact Me](https://github.com/Moneymoney122/boot-script#issuescontact-me)
           - [Possible future updates](https://github.com/Moneymoney122/boot-scriptr#possible-future-updates)
             - [Images, No useful reason why I want to add them](https://github.com/Moneymoney122/boot-script#images-no-useful-reason-why-i-want-to-add-them)
              
## What is this?

- This script is for tether booting A8/A9 devices that have been downgraded by [sunst0rm](https://github.com/mineek/sunst0rm)
  - It might work with devices that have been tethered downgraded by other tools.
  
   - Also capable of running the commands for checkra1n
  
- I made this script for personal use, but anyone can use it

- This script is not made by mineek, it is made by me (Moneymoney122)

- It is intended for use on Linux (only tested on Arch Linux, but should work on every distro)

   - ~~it might work on Mac OS, but I don't know~~

    - *Update: tested on Mac OS Catalina (10.15) and it works*

- Use it at your own risk, I am not responsible for any damage it may cause.

- I have no idea why I made this script, and I have no idea if it is actually useful or not

- it may or may not work

- Released on the 1st of October 2022

- License: GPL-3.0 license

## Credits:

- Me (Moneymoney122) for making this script

- rushia (@rushia27) for helping me make this and add features to it

- Mineek for making the [sunst0rm](https://github.com/mineek/sunst0rm) script

## How to use this script:

 run `git clone https://github.com/Moneymoney122/boot-script` in the terminal while in your home directory or download the zip from this page and unzip the files and place them in a folder called "boot-script" (without the quotes) in your home directory

 - *if you have already downloaded this script and you want to update it*, run: `cd ~/boot-script/ && git pull`


- And then run:

`cd ~/boot-script/`

`chmod +x boot.sh` or if you want to use the other versions of this script: `chmod +x boot.sh old-boot.sh test-boot.sh`

`./boot.sh` or if you want to use the old version: `./old-boot.sh` or if you want to use the test version: `./test-boot.sh`

This script will ask for your user's password, this is not intended to be anything malicious and you can check the code yourself if you want

## Dependencies for this script: 

- sunst0rm if you want to tether downgrade your device: https://github.com/mineek/sunst0rm

    - linux fork of sunst0rm: https://github.com/MCApollo/sunst0rm

- ideviceinfo and ideviceenterrecovery: https://github.com/libimobiledevice/libimobiledevice

- libirecovery: https://github.com/libimobiledevice/libirecovery

- ipwndfu, gaster or some other tool that is capable of putting your device in pwned dfu mode with signature checks removed

  - fork of ipwndfu for A8/A9 devices: https://github.com/exploit3dguy/ipwndfu

   - gaster: https://github.com/0x7ff/gaster
  
    - python2 is required for ipwndfu

     - if you use any other tool than ipwndfu/gaster then you will need to pwn your device with sigchecks removed and then run the script and when you get to the pwning part of the script you will need to enter the option "already pwned" 

- if you want checkra1n: https://checkra.in


- sudo

- git

- awk

## Issues/Contact Me:

- Current issues: none

- If you have any issues with this script or any of my other projects, please open a github issue or contact me on twitter (@chandler_hacker)

## Possible future updates:

- None at the moment, I am open to ideas on what to add.

## Images, No useful reason why I want to add them:

- iOS 14

![This is an image](https://images.idgesg.net/images/article/2020/06/ios14-logo-100849580-large.3x2.jpg)

