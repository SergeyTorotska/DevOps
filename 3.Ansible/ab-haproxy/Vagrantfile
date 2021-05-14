Vagrant.configure("2") do |config|
  
  config.vm.box = "ubuntu/bionic64"
  config.vm.define "ab-haproxy" do |machine|
	machine.vm.network "private_network", ip: "192.168.99.100"
	machine.vm.provision "shell", inline: "echo ubuntu:ubuntu | chpasswd"
  end
 config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook1.yml"
  end
end
