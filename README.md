# Ubuntu-Snort3-Installation-Package
---------------------------------------------------------------------------------------
Gathered by, Sepehr Goodarzi
Computer Engineering Student at A.Borujerdi University
Email: sepehrgoodarzi6@gmail.com
---------------------------------------------------------------------------------------
As you may know, Snort Community has not offered a fully packed installation package for Ubuntu, which is one of the most used linux distros as a server. So I decided to bring one to Ubuntu with all the requirements using the source code.
At the very first step, you need to download the updated ruleset. In order to do that, you should go to "http://www.snort.com/" and download a ruleset (registerd one is recommended, you do not need to pay for it, you just sign up to their website and then you are going to be able to download it) and save it to the "snort-src" folder. Then run the commands down bellow. Also you should download Splunk from the official website "http://www.splunk.com/", then save the installer to the "snort-src" folder.
Now we got all the prequestics and we can start the installation. By following the instructions you are going to have Snort and its ruleset, OpenAppID, Splunk and an example plugin (to go on for the next ones) installed and also configured (for further results, you should config the files manually). Just run the mentioned commands in order(just have in mind, that it is going to take a while, so relax and grab a cup of coffee!). You are going to have your pc rebooted after the proccesses located at the lines 14 and 16, so do not worry about it:

~$ sudo apt install -y git

~$ git clone https://github.com/sepehrgoodarzi6/Ubuntu-Snort3-Installation-Package/

~$ cd Snort3-Installation-Package

~$ chmod +x Dist-Upgrade.sh

~$ ./Dist-Upgrade.sh

~$ chmod +x Installation-Script.sh

~$ ./Installation-Script.sh

Just one more step to go!
Open up the Terminal and then follow the instructions:

~$ route

Write down the Net-Iface.

~$ sudo vi /lib/systemd/system/ethtool.service

Replace it with "ens3" and save the file (according to your network card, it might be eth0, wlp3s0, ...).

~$

~$
