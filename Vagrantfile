# From http://stackoverflow.com/a/33138627
#
# For examples on parameterizing see:
# http://stackoverflow.com/questions/13065576/override-vagrant-configuration-settings-locally-per-dev

## Still have boilerplate comments:
# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
#  config.vm.box = "base"
  
  # Ubuntu Server 14.04 LTS
  # config.vm.box = "ubuntu/trusty64"
  # config.vm.box = "hashicorp/precise64"
  config.vm.box = "box-cutter/ubuntu1404-desktop"
  # config.vm.box = "box-cutter/ubuntu1604-desktop"
  
  # See: http://stackoverflow.com/a/20431791
  # Seealso: http://friendsofvagrant.github.io/v1/docs/config/vm/define.html
  config.vm.define "jalidev" do |jalidev|
  end
  
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  
  config.vm.synced_folder "C:\\git", "/git"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.
  
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true
    vb.name = "jalidev"
  end
  
  

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
  
  # https://www.vagrantup.com/docs/provisioning/basic_usage.html
  config.vm.provision "shell" do |s|
    s.inline = <<-SHELL
      sudo apt-get -y update

      # Do we need umake?  
      # sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make
      
      # python dev needed for sphinx
      sudo apt-get -y install python-dev libxml2-dev libxslt-dev
SHELL
  end
  
  config.vm.provision "shell", inline: "sudo apt-get -y install python-pip"
  
  # Do we need umake? 
  # config.vm.provision "shell", inline: "sudo apt-get -y install ubuntu-make"
  
  # Install Unzip.
  config.vm.provision "shell", inline: "sudo apt-get -y install unzip"

  
  # Install Docker
  # config.vm.provision "shell", inline: "sudo apt-get -y install apt-transport-https ca-certificates"
  # config.vm.provision "shell", inline: "sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D"
  #
  ## Add the following file using sudo>> DOESN'T WORK
  ## sudo echo deb https://apt.dockerproject.org/repo ubuntu-trusty main > /etc/apt/sources.list.d/docker.list
  #
  ## Appears already installed for this vagrant box.
  # config.vm.provision "shell", inline: "sudo apt-get -y install linux-image-extra-$(uname -r)"
  #
  ## apparmor needed for 14.04
  ## Appears already installed for this vagrant box.
  # config.vm.provision "shell", inline: "sudo apt-get -y install apparmor"
  #
  # config.vm.provision "shell", inline: "sudo apt-get -y install docker-engine"
  
  # Install Hack font
  # TODO: For Ubuntu v16
  # config.vm.provision "shell", inline: "sudo apt-get install fonts-hack-ttf"
  # For previous versions of Ubuntu:
  config.vm.provision "shell", inline: "wget https://github.com/chrissimpkins/Hack/releases/download/v2.019/Hack-v2_019-ttf.zip -nv -O /tmp/hackfonts.zip"
  config.vm.provision "shell", inline: "sudo unzip /tmp/hackfonts.zip -d /usr/share/fonts/truetype/hack"

  # Install git
  config.vm.provision "shell", inline: "sudo apt-get -y install git"

  # Install Node
  config.vm.provision "shell", inline: "curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -"
  config.vm.provision "shell", inline: "sudo apt-get install -y nodejs"

  # Install VS Code

  # Do we need umake? 
  # config.vm.provision "shell", inline: "umake ide visual-studio-code ~/.local/share/umake/ide/visual-studio-code  --accept-license"

  config.vm.provision "shell", inline: "wget https://go.microsoft.com/fwlink/?LinkID=760868 -nv -O /tmp/vscode-amd64.deb"
  config.vm.provision "shell", inline: "sudo dpkg -i /tmp/vscode-amd64.deb"
  
  # Install sphinx
  config.vm.provision "shell", inline: "sudo apt-get -y install libyaml-dev"
  # TODO: Install of PyYAML spews many warnings. Can this be fixed?
  config.vm.provision "shell", inline: "sudo pip install sphinx sphinx-autobuild"
end
