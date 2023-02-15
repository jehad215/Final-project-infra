#!/bin/bash

sudo apt install -y apt-transport-https ca-certificates gnupg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.gpg
sudo apt-get update && sudo apt-get install -y google-cloud-cli
sudo apt-get install kubectl -y
sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin -y
sudo git clone https://github.com/jehad215/Jehad-Project.git /home/jehad/test
sudo apt-get install -y ansible
sudo ansible-playbook /home/jehad/test/ansible.yaml

