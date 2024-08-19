$script = <<-SCRIPT
apt-get update
apt-get install git docker docker-compose -y
systemctl enable docker && systemctl start docker
chown -R vagrant:vagrant /media
git clone https://github.com/rubilmax/homeflix.git
chown -R vagrant:vagrant homeflix
cd homeflix
cp .env.example .env
docker-compose up -d
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.provision "shell", inline: $script
  config.vm.network "private_network", ip: "192.168.7.7"
end
