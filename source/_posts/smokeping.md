---
title: "0x05 - Smokeping"
tag: "0x05"
category: "do it"
date: "7/29/2024 03:00 PM"
---

SmokePing is a tool that measures latency, packet loss, and latency distribution on a network. It's written in Perl and works by sending Internet Control Message Protocol (ICMP) echo requests between two or more hosts on a network and recording how long it takes for each request to complete. SmokePing can be used to monitor the latency of individual applications, web servers, databases, and more, on both small local networks and large enterprise networks.

pre-setup (only for centos 7 users since the main package repo is down):

yum setup:
```
nano /etc/yum.repos.d/CentOS-Base.repo
```
```

[base]
name=CentOS-$releasever - Base
#mirrorlist=https://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os&infra=$infra
baseurl=http://vault.centos.org/7.9.2009/os/x86_64/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

[updates]
name=CentOS-$releasever - Updates
#mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os&infra=$infra
baseurl=https://vault.centos.org/7.9.2009/os/x86_64/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

[extras]
name=CentOS-$releasever - Extras
#mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=extras&infra=$infra
baseurl=https://vault.centos.org/7.9.2009/extras/x86_64/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
```
```
yum clean all
yum repolist
```

smokeping installation (2.8.2):

--pre-reqs--

```
yum install -y bind-utils curl rrdtool bind-utils perl-libwww-perl perl-rrdtool wget
```
-fping-

```
wget http://fping.org/dist/fping-3.10.tar.gz
tar -xvf fping-3.10.tar.gz
cd fping-3.10
./configure --prefix=/usr/local --enable-ipv4 --enable-ipv6
```
```
make
make install
```

--smokeping--
```
mkdir smokeping
wget https://oss.oetiker.ch/smokeping/pub/smokeping-2.8.2.tar.gz
sudo tar -xvzf smokeping-2.8.2.tar.gz
cd smokeping-2.8.2
LC_ALL=C ./configure --prefix=/usr/local/smokeping
```
```
yum install perl-ExtUtils-MakeMaker perl-ExtUtils-Manifest perl-Module-CoreList perl-Sys-Syslog -y
```

--installation--
```
make install
```

--create the required directories by smokeping--

```
mkdir /usr/local/smokeping/cache
mkdir /usr/local/smokeping/data
mkdir /usr/local/smokeping/var
```

--test smokeping--

```
/usr/local/smokeping/bin/smokeping --version
```

--smokeping config add--

edit the config file: /usr/local/smokeping/etc/config

```
# This Smokeping example configuration file was automatically generated.
#
# Everything up to the Probes section is derived from a common template file.
# See the Probes and Targets sections for the actual example.
#
# This example is included in the smokeping_examples document.

*** General ***

owner    = Peter Random
contact  = some@address.nowhere
mailhost = my.mail.host
sendmail = /sbin/sendmail
# NOTE: do not put the Image Cache below cgi-bin
# since all files under cgi-bin will be executed ... this is not
# good for images.
imgcache = /usr/local/smokeping/cache
imgurl   = cache
datadir  = /usr/local/smokeping/data
piddir  = /usr/local/smokeping/var
cgiurl   = http://192.168.69.109/smokeping/sm.cgi
smokemail = /usr/local/smokeping/etc/smokemail.dist
tmail = /usr/local/smokeping/etc/tmail.dist
# specify this to get syslog logging
syslogfacility = local0
# each probe is now run in its own process
# disable this to revert to the old behaviour
# concurrentprobes = no

*** Alerts ***
to = alertee@address.somewhere
from = smokealert@company.xy

+someloss
type = loss
# in percent
pattern = >0%,*12*,>0%,*12*,>0%
comment = loss 3 times  in a row

*** Database ***

step     = 300
pings    = 20

# consfn mrhb steps total

AVERAGE  0.5   1  28800
AVERAGE  0.5  12   9600
    MIN  0.5  12   9600
    MAX  0.5  12   9600
AVERAGE  0.5 144   2400
    MAX  0.5 144   2400
    MIN  0.5 144   2400

*** Presentation ***

template = /usr/local/smokeping/etc/basepage.html.dist
htmltitle = yes
graphborders = no

+ charts

menu = Charts
title = The most interesting destinations

++ stddev
sorter = StdDev(entries=>4)
title = Top Standard Deviation
menu = Std Deviation
format = Standard Deviation %f

++ max
sorter = Max(entries=>5)
title = Top Max Roundtrip Time
menu = by Max
format = Max Roundtrip Time %f seconds

++ loss
sorter = Loss(entries=>5)
title = Top Packet Loss
menu = Loss
format = Packets Lost %f

++ median
sorter = Median(entries=>5)
title = Top Median Roundtrip Time
menu = by Median
format = Median RTT %f seconds

+ overview

width = 600
height = 50
range = 10h

+ detail

width = 600
height = 200
unison_tolerance = 2

"Last 3 Hours"    3h
"Last 30 Hours"   30h
"Last 10 Days"    10d
"Last 360 Days"   360d

#+ hierarchies
#++ owner
#title = Host Owner
#++ location
#title = Location

# (The actual example starts here.)

*** Probes ***

# Here we have just one probe, fping, pinging four hosts.
#
# The fping probe is using the default parameters, some of them supplied
# from the Database section ("step" and "pings"), and some of them by
# the probe module.

+FPing
binary = /usr/local/sbin/fping

*** Targets ***

# The hosts are located in two sites of two hosts each, and the
# configuration has been divided to site sections ('+') and host subsections
# ('++') accordingly.

probe = FPing

menu = Top
title = Network Latency Grapher
remark = Welcome to this SmokePing website.

+ internet
menu = internet sites
title = popular sites on the internet

++ google
host = google.com
++ linkedin
host = linkedin.com

+ intranet
menu = intranet sites
title = Hosts in intranet

++ gateway
host = gateway.home
++ dns
host = pi.hole.home
```

--smokeping service file configuration--

Edit the smokeping.service file: /etc/systemd/system/smokeping.service 

```
[Unit]
Description=Smokeping Server: Latency Logging and Graphing System
After=syslog.target network-online.target

[Service]
ExecStart=/usr/local/smokeping/bin/smokeping --nodaemon --config=/usr/local/smokeping/etc/config --logfile=/var/log/smokeping.log
ExecReload=/bin/kill -HUP $MAINPID
Restart=always
RestartSec=5
Nice=19
IOSchedulingClass=3
PrivateTmp=true

[Install]
WantedBy=multi-user.target
```


--smokeping service setup--

```
systemctl enable smokeping.service
```

--httpd setup--

```
yum install httpd mod_fcgid -y
chown apache:apache -R /usr/local/smokeping/
```

--smokeping httpd config--

Add the following config to the smokeping.conf file in httpd: /etc/httpd/conf.d/smokeping.conf

```
<Directory "/usr/local/smokeping/cache">
#  AllowOverride all
  Require all granted
</Directory>

<Directory "/usr/local/smokeping/htdocs/">
#  Options FollowSymLinks ExecCGI
#  AllowOverride all
  Require all granted
</Directory>

ScriptAlias /smokeping/sm.cgi  /usr/local/smokeping/htdocs/smokeping.fcgi.dist

Alias /smokeping/cache /usr/local/smokeping/cache
Alias /smokeping /usr/local/smokeping/htdocs/
```

```
systemctl enable httpd.service
```

--Reboot the system--

```
reboot
```

Note check and make sure there are approprite permissions set for the smokeping folder which should be 755 for /usr/local/smokeping if you encounter any issues related to service failing.
