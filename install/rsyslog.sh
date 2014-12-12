rsyslog1(){
export DEBIAN_FRONTEND=noninteractive
sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
apt-get -y update 
apt-get -y -q install software-properties-common python-software-properties
add-apt-repository -y ppa:adiscon/v8-stable
apt-get -y update 
apt-get -y -q install rsyslog

sed 's/#$ModLoad imudp/$ModLoad imudp/' -i /etc/rsyslog.conf
sed 's/#$UDPServerRun 514/$UDPServerRun 514/' -i /etc/rsyslog.conf
sed 's/#$ModLoad imtcp/$ModLoad imtcp/' -i /etc/rsyslog.conf
sed 's/#$InputTCPServerRun 514/$InputTCPServerRun 514/' -i /etc/rsyslog.conf
}
