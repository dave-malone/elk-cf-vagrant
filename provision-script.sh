#!/bin/sh

sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections && echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get -y install oracle-java8-installer


wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | sudo apt-key add -
echo 'deb http://packages.elasticsearch.org/elasticsearch/1.4/debian stable main' | sudo tee /etc/apt/sources.list.d/elasticsearch.list
sudo apt-get update
sudo apt-get -y install elasticsearch=1.4.4
sudo cp /vagrant/resources/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
sudo service elasticsearch restart
sudo update-rc.d elasticsearch defaults 95 10

cd ~; wget https://download.elasticsearch.org/kibana/kibana/kibana-4.0.1-linux-x64.tar.gz
tar xvf kibana-*.tar.gz
sudo cp /vagrant/resources/kibana.yml ~/kibana-4*/config/kibana.yml
sudo mkdir -p /opt/kibana
sudo cp -R ~/kibana-4*/* /opt/kibana/
sudo cp /vagrant/resources/kibana4.sh /etc/init.d/kibana4
cd /etc/init.d
sudo chmod +x /etc/init.d/kibana4
sudo update-rc.d kibana4 defaults 96 9
sudo service kibana4 start

echo 'deb http://packages.elasticsearch.org/logstash/1.5/debian stable main' | sudo tee /etc/apt/sources.list.d/logstash.list
sudo apt-get update
sudo apt-get install logstash
sudo cp /vagrant/resources/syslog.conf /etc/logstash/conf.d/syslog.conf
sudo service logstash restart