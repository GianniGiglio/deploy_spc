# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # box to build virtual evironment to build off of.
  config.vm.box = "precise64"
  config.vm.box_download_insecure = true
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.define "spc" do |eng|
      eng.vm.box = "baseBox"
      eng.vm.box_url = "https://cbs-test.melexis.com/oldBaseBox.box"
      eng.vm.host_name = "spc"
      eng.vm.network :forwarded_port, guest: 8181, host: 8181
      eng.vm.network :forwarded_port, guest: 5432, host: 5432
      eng.vm.network :forwarded_port, guest: 61616, host: 61616
      eng.vm.synced_folder "../spc4mlx2-functest" , "/home/vagrant/spc4mlx2-functests", type: "nfs"
      #if this fails then run on your machine (as root): apt-get install nfs-kernel-server
      eng.vm.synced_folder ENV['HOME'] + "/.m2" ,  "/home/vagrant/.m2", type: "nfs"
      eng.vm.provider "virtualbox" do |vb|
       vb.name = "spc-deploy"
       vb.memory = 4096
       vb.cpus = 4
       vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      end
      eng.vm.network "private_network", ip: "192.168.33.11"
      eng.vm.provision "shell", path: "vagrant/provisioners/copy_initscript_servicemix.sh"
      eng.vm.provision "shell", path: "vagrant/provisioners/copy_initscript_sonar.sh"
      eng.vm.provision "shell", path: "vagrant/provisioners/start_init_scripts.sh"
      eng.vm.provision "shell", inline: $initializeBACKEND
      eng.vm.provision "shell", path: "vagrant/vagrant_conf/spc_db_init/initPostgres.sh"
    end
end

$initializeBACKEND = <<END
sudo mkdir -p /etc/spc4mlx2
cp /vagrant/vagrant/vagrant_conf/spc4mlx2/etc/* /etc/spc4mlx2
cp /vagrant/vagrant/vagrant_conf/servicemix/deploy/* apache-servicemix-4.4.1-fuse-07-11/deploy
END

#USAGE:

#Vagrant up start 2 vm's:
#spc-ui: env for play.
#usage:
#vagrant ssh spc-ui
#ui-run or ui-debug

#spc-eng: env with esb/capistrano/maven/etc
#vagrant ssh spc-eng
#cap vm spc4mlx2:latest
