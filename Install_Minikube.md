# MiniKube
A lightweight tool that enables you to run Kubernetes clusters locally on your machine. It's useful for developers who want to experiment with Kubernetes or test their applications locally before deploying them to a production Kubernetes environment.

## Install minikube in ubuntu linux

### What you’ll need
- 2 CPUs or more
- 2GB of free memory
- 20GB of free disk space
- Internet connection
- Container or virtual machine manager, such as: Docker, QEMU, Hyperkit, Hyper-V, KVM, Parallels, Podman, VirtualBox, or VMware Fusion/Workstation

1. Navigate to this url for installaition instructions
## https://minikube.sigs.k8s.io/docs/start/

2. Select your OS (in this case linux)

3. Install docker for ubuntu. Use link for installtion guide (https://docs.docker.com/engine/install/ubuntu/)
```bash
- sudo apt-get update
- sudo apt-get install ca-certificates curl gnupg
- sudo install -m 0755 -d /etc/apt/keyrings
- curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
- sudo chmod a+r /etc/apt/keyrings/docker.gpg
- echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
- sudo apt-get update
- sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
- docker --version
- sudo usermod -aG docker $USER && newgrp docker
```

3. Install Virtualbox using the link for installation guide : https://www.virtualbox.org/wiki/Linux_Downloads

# Add the following line to your /etc/apt/sources.list
```bash
sudo vim /etc/apt/sources.list
``` 

# Then paste the following below and save. press "i" to be on insert mode and ":wq!" to save the file
- deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian jammy contrib

# Download and verify the oracle public key by running the command below
```bash
wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --dearmor --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg
```

# Install virtual box by running
```bash 
sudo apt-get update
sudo apt-get install virtualbox-6.1
```

4. STart Minikube by running 
```bash
minikube start
```

## Install Minikube on Windows

### What you’ll need
- 2 CPUs or more
- 2GB of free memory
- 20GB of free disk space
- Internet connection
- Container or virtual machine manager, such as: Docker, QEMU, Hyperkit, Hyper-V, KVM, Parallels, Podman, VirtualBox, or VMware Fusion/Workstation

To install the latest minikube stable release on x86-64 Windows using Chocolatey:

1. If the Chocolatey Package Manager is installed, use the following command:
```bash
choco install minikube
```

2. From a terminal with administrator access (but not logged in as root), run:
```bash
minikube start
```

3. Start intercating with your cluster by running 
```bash
kubectl get po
```