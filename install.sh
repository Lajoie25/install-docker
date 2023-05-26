# Scipt pour installer la derniere version de docker et docker compose
# avant de pouvoir le lancer, copier se scipt sur votre serveur,
# dans l'emplacement du script, faire: 
# -> sudo chmod +x install-docker.sh
# -> sudo ./install-docker.sh

apt-get update -y
apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release 
mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg


echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update -y

apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo $(docker -v)

echo $(docker compose version)
