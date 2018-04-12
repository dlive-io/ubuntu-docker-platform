apt-get remove -y docker docker-engine docker.io
apt-get update -y
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Verify 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88
# apt-key fingerprint 0EBFCD88

add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update -y
apt-get install -y docker-ce

# Add user ubuntu to the docker group
gpasswd -a ubuntu docker

service docker restart

# Print docker daemon info
docker info

# Move cuda installation here
apt-get install -y --no-install-recommends apt-utils
apt-get install -y wget unzip git
apt-get install -y software-properties-common python-software-properties
apt-get install -y build-essential curl git libfreetype6-dev libpng12-dev libzmq3-dev pkg-config python-dev python-numpy python-pip  swig zip zlib1g-d
apt-get -y install autoconf automake build-essential libass-dev libfreetype6-dev \
  libsdl2-dev libtheora-dev libtool libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev \
  libxcb-xfixes0-dev pkg-config texinfo zlib1g-dev

add-apt-repository ppa:graphics-drivers/ppa -y
apt-get update
apt-get install nvidia-390 nvidia-390-dev -y
apt-get install nvidia-cuda-toolkit --install-recommends -y
apt-get clean

nvidia-smi
