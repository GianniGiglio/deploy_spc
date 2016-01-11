echo "Copying init scripts for sonar";
sudo cp /vagrant/vagrant/vagrant_conf/init/sonar /etc/init.d/sonar
sudo chmod +x /etc/init.d/sonar
sudo update-rc.d sonar defaults 95
