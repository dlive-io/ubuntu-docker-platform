add-apt-repository ppa:graphics-drivers/ppa -y
apt-get update
apt-get install nvidia-390 nvidia-390-dev -y
apt-get install nvidia-cuda-toolkit --install-recommends -y
apt-get clean
