#! /bin/bash
# Script to install WiFi geo-tools

echo installing WHAT-PRO and geo-tools
echo installing iSniff-GPS
apt-get update && apt-get upgrade -y
apt-get install python-pip python-setuptools git git-core gpsd gpsd-clients python-m2crypto libgcrypt11-dev libnl-3-dev libnl-genl-3-dev libxml-libxml-perl libdbi-perl libdbd-sqlite3-perl -y
rm -r /etc/ettercap/etter.conf
cp /root/WHAT-PRO/dns2proxy.sh /root/dns2proxy.sh 
git clone https://github.com/byt3bl33d3r/sslstrip2.git
cd /root/
git clone https://github.com/LeonardoNve/dns2proxy.git
cd /root/WHAT-PRO/sslstrip2 && python setup.py install
cp /root/WHAT-PRO/etter.conf /etc/ettercap/etter.conf
cd .. && mkdir geo-tools && cd geo-tools
git clone https://github.com/hubert3/iSniff-GPS.git
cd iSniff-GPS
pip install -U -r requirements.txt
rm -r *screenshot* *slides*
echo finished installing iSniff-GPS
cd ..
echo installing loc-nogps
apt-get install subversion -y
git clone https://github.com/haxorthematrix/loc-nogps.git
cd loc-nogps
svn checkout http://pygmaps.googlecode.com/svn/trunk pygmaps-read-only
cd pygmaps-read-only
python setup.py build
python setup.py install
cd .. && rm -r sample_files && cd ..
echo finished installing loc-nogps
echo All finished

