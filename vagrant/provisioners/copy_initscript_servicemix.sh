echo "Copying init scripts for servicemix";
cp /vagrant/vagrant/vagrant_conf/servicemix/etc/* apache-servicemix-4.4.1-fuse-07-11/etc
sudo cp /vagrant/vagrant/vagrant_conf/init/servicemix /etc/init.d/servicemix
sudo chmod +x /etc/init.d/servicemix
sudo update-rc.d servicemix defaults 99
