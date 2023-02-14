#!/bin/bash
#To install Google Cli

sudo apt install -y apt-transport-https ca-certificates gnupg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.gpg
sudo apt-get update && sudo apt-get install -y google-cloud-cli
#To Install Kubectl
sudo apt-get install kubectl -y
#To Install google plugin
sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin -y
#Git Clone
sudo git clone https://github.com/jehad215/Jehad-Project.git /home/jehad/test
#To install ansible 
sudo apt-get install -y ansible
#Run Ansible Playbook To Connect With cluster And deploy Jenkins With Services
sudo ansible-playbook /home/jehad/test/ansible.yaml

