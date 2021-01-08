sudo dpkg-reconfigure tzdata
sudo apt-get install -y openssh-server
sudo apt-get install -y ethtool
sudo apt-get install -y build-essential
sudo apt-get install -y libpcap-dev
sudo apt-get install -y libpcre3-dev
sudo apt-get install -y libdumbnet-dev
sudo apt-get install -y zlib1g-dev
sudo apt install -y net-tools
sudo apt install -y make
sudo apt install -y cmake
sudo apt install -y wget
sudo apt install -y git
sudo apt install -y ethtool
mkdir ~/snort_src
cd ~/snort_src
sudo apt-get install -y build-essential autotools-dev libdumbnet-dev \libluajit-5.1-dev libpcap-dev zlib1g-dev pkg-config libhwloc-dev \cmake
sudo apt-get install -y liblzma-dev openssl libssl-dev cpputest \libsqlite3-dev uuid-dev
sudo apt-get install -y asciidoc dblatex source-highlight w3m
sudo apt-get install -y libtool git autoconf
sudo apt-get install -y bison flex libcmocka-dev
sudo apt-get install -y libnetfilter-queue-dev libmnl-dev
cd ~/snort_src
wget https://github.com/rurban/safeclib/releases/download/v08112019/libsafec-08112019.0-gad76c7.tar.gz
tar -xzvf libsafec-08112019.0-gad76c7.tar.gz
cd libsafec-08112019.0-gad76c7/
./configure
make
sudo make install
cd ~/snort_src/
wget https://ftp.pcre.org/pub/pcre/pcre-8.43.tar.gz
tar -xzvf pcre-8.43.tar.gz
cd pcre-8.43
./configure
make
sudo make install
sudo apt-get install -y libunwind-dev
cd ~/snort_src
wget https://github.com/gperftools/gperftools/releases/download/gperftools-2.7.90/gperftools-2.7.90.tar.gz
tar xzvf gperftools-2.7.90.tar.gz
cd gperftools-2.7.90
./configure
make
sudo make install
cd ~/snort_src
wget http://www.colm.net/files/ragel/ragel-6.10.tar.gz
tar -xzvf ragel-6.10.tar.gz
cd ragel-6.10
./configure
make
sudo make install
cd ~/snort_src
wget https://dl.bintray.com/boostorg/release/1.72.0/source/boost_1_72_0.tar.gz
tar -xvzf boost_1_72_0.tar.gz
cd ~/snort_src
wget https://github.com/intel/hyperscan/archive/v5.2.1.tar.gz
tar -xvzf v5.2.1.tar.gz
mkdir ~/snort_src/hyperscan-5.2.1-build
cd hyperscan-5.2.1-build/
cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DBOOST_ROOT=~/snort_src/boost_1_72_0/ ../hyperscan-5.2.1
make
sudo make install
cd ~/snort_src/hyperscan-5.2.1-build/
./bin/unit-hyperscan
cd ~/snort_src
wget https://github.com/google/flatbuffers/archive/v1.12.0.tar.gz \-O flatbuffers-v1.12.0.tar.gz
tar -xzvf flatbuffers-v1.12.0.tar.gz
mkdir flatbuffers-build
cd flatbuffers-build
cmake ../flatbuffers-1.12.0
make
sudo make install
cd ~/snort_src
git clone https://github.com/snort3/libdaq.git
cd libdaq
./bootstrap
./configure
make
sudo make install
sudo ldconfig
cd ~/snort_src
git clone git://github.com/snortadmin/snort3.git
cd snort3
./configure_cmake.sh --prefix=/usr/local --enable-tcmalloc
cd build
make
sudo make install
sudo cp 
make
sudo make install
sudo cp ECNI /lib/systemd/system/ethtool.service
sudo systemctl enable ethtool
sudo service ethtool start
cd ~/snort_src/
wget https://snort.org/downloads/openappid/12159 -O OpenAppId-12159.tgz
tar -xzvf OpenAppId-12159.tgz
sudo cp -R odp /usr/local/lib/
sudo mkdir /usr/local/etc/rules
sudo mkdir /usr/local/etc/builtin_rules
sudo mkdir /usr/local/etc/so_rules
sudo mkdir /usr/local/etc/lists
cd ~/snort_src/
mkdir snortrules-3000
tar -xvzf snortrules-snapshot-3000.tar.gz -C ./snortrules-3000
cd snortrules-3000
sudo cp ./rules/*.rules /usr/local/etc/rules/
sudo cp ./builtins/builtins.rules /usr/local/etc/builtin_rules/
sudo cp ./etc/* /usr/local/etc/snort/
cd
mkdir pcaps
cd pcaps
wget https://download.netresec.com/pcap/maccdc-2012/maccdc2012_00000.pcap.gz
gunzip maccdc2012_00000.pcap.gz
wget https://download.netresec.com/pcap/maccdc-2012/maccdc2012_00001.pcap.gz
gunzip maccdc2012_00001.pcap.gz
snort -c /usr/local/etc/snort/snort.lua \-r ~/pcaps/maccdc2012_00000.pcap -A alert_fast -s 65535 -k none
snort -c /usr/local/etc/snort/snort.lua --pcap-filter \*.pcap \--pcap-dir ~/pcaps -A alert_fast -s 65535 -k none
sudo dpkg -i splunk-8.*.deb
sudo /opt/splunk/bin/splunk start --answer-yes --accept-license
sudo /opt/splunk/bin/splunk stop
sudo /opt/splunk/bin/splunk enable boot-start -systemd-managed 1
sudo service Splunkd start
sudo mkdir /opt/splunk/etc/apps/TA_Snort3_json/local
sudo touch /opt/splunk/etc/apps/TA_Snort3_json/local/inputs.conf
sudo cp Splunk-Config /opt/splunk/etc/apps/TA_Snort3_json/local/inputs.conf
sudo service Splunkd restart
cd ~/snort_src/
git clone https://github.com/snort3/snort3_extra.git
cd ./snort3_extra/
export /usr/local/=/usr/local/lib/pkgconfig/
./configure_cmake.sh --prefix=/usr/local
cd build
make
sudo make install
sudo groupadd snort
sudo useradd snort -r -s /sbin/nologin -c SNORT_IDS -g snort
sudo rm /var/log/snort/*
sudo chmod -R 5775 /var/log/snort
sudo chown -R snort:snort /var/log/snort
sudo systemctlenablesnort3
sudo service snort3 start
sudo reboot
