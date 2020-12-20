sudo locale-gen ja_JP.UTF-8
# when activate, activate with japanese
echo export LANG=ja_JP.UTF-8 >> ~/.profile
# apply the setting
source ~/.profile

# change timezone to jst
sudo timedatectl set-timezone Asia/Tokyo

echo "apt get のアップデートを行います"
sudo apt update -y
sudo apt upgrade -y

sudo apt install ubuntu-desktop -y

echo "Docker依存のライブラリをインストールします"
# Install packages to allow apt to use a repository over HTTPS:
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

echo "Dockerのaptレポジトリを追加します"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

# dockerをインストール
sudo apt update -y
echo "Dockerをインストールします"
sudo apt install -y docker-ce docker-ce-cli containerd.io
docker -v
echo "dockerユーザの追加を行います"
sudo groupadd docker
sudo usermod -aG docker $USER
docker info

echo "docker-composeをインストールします"
sudo curl -L https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose -v

echo "VSCodeをインストールします"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt install apt-transport-https -y
sudo apt update -y
sudo apt install code -y

echo "Chromeをインストールします"
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt update -y
sudo apt install google-chrome-stable -y
