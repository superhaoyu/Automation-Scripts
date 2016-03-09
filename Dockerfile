FROM ubuntu:14.04

RUN apt-get install -qq -y wget git

RUN wget --directory-prefix=/root  http://files.trendmicro.com/products/deepsecurity/en/9.6/Agent-Ubuntu_14.04-9.6.2-5027.x86_64.zip

RUN apt-get install -qq -y zip 

RUN unzip /root/Agent-Ubuntu_14.04-9.6.2-5027.x86_64.zip -d /root/DSA 

RUN dpkg -i /root/DSA/Agent-Core-Ubuntu_14.04-9.6.2-5027.x86_64.deb 

RUN /etc/init.d/ds_agent start
