Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "10.0.12.14"
  config.vm.provision "shell", inline: "sudo apt-get update && sudo apt-get install -y nginx"
  config.vm.synced_folder "src/", "/srv/website", create: true
end
