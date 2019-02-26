sudo apt-get update
sudo apt-get install -y build-essential checkinstall libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev python2.7 git
sudo wget -O - https://raw.githubusercontent.com/c9/install/master/install.sh | bash

wget https://nodejs.org/dist/v10.15.0/node-v10.15.0-linux-x64.tar.xz
tar -xf node-v10.15.0-linux-x64.tar.xz
sudo cp -r node-v10.15.0-linux-x64/{bin,include,lib,share} /usr/
rm -rf node-v10.15.0-linux-x64.tar.xz
rm -rf node-v10.15.0-linux-x64

git clone https://github.com/c9/core.git c9sdk
cd c9sdk
git pull origin master
scripts/install-sdk.sh
# sudo ufw enable
sudo ufw allow 22/tcp
sudo ufw allow 3389/tcp

npm install -g pm2
pm2 start server.js -- -l 0.0.0.0 -p 3389 -a root:PaSSwOrD
pm2 startup
pm2 save
