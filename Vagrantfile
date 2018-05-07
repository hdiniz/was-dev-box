# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "hashicorp/precise64"

    # expose as private network
    config.vm.network "private_network", ip: "10.0.0.2"

    config.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
    end

    config.vm.provision "shell", name: "tools", path: "provision/tools.sh"

    config.vm.provision "shell", name: "was_install", path: "provision/was.sh",
      env: {
        "IBMIM_INPUT_FILE" => "/vagrant/was/ibmim_response_was-8.0.0.xml",
        "IBM_ID" => "IBM_ID",
        "IBM_PASS" => "IBM_PASS",
      }

    config.vm.provision "shell", name: "was_maven", path: "provision/was_maven.sh",
      env: {
        "WAS_INSTALL_DIR" => "/opt/IBM/WebSphere/AppServer",
        "WAS_POM" => "/vagrant/was/was.installer-8.0.0.pom"
      }

    config.vm.provision "shell", name: "was_config", path: "config/was_config.sh"
end
