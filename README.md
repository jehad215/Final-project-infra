### Overview
Deploy a Python web application on GKE using CI/CD Jenkins Pipeline using the following steps and high-level diagram:

1. Implement a secure GKE Cluster
2. Deploy and configure Jenkins on GKE
3. Deploy the backend application on GKE using the Jenkins pipeline


### Used Tools
 - Terraform
 - Jenkins
 - Docker
 - Ansible
 - Kubernates

<!-- ![home_Page Image](./images/terraform.png)
![home_Page Image](./images/docker.png)
![home_Page Image](./images/ansible.png)
![home_Page Image](./images/jenkins.png)
![home_Page Image](./images/kubernetes.png) -->

#### And all work is applied on a single GCP project: jehad-iti, and region: us-east4.

<!-- ![home_Page Image](./images/GCP.png =150x150) -->

### This project devided int two parts:
 ##### - First: Infrastructure
 ##### - Second: App

### First part: Infrastructure

#### Creating resources with terraform
in terraform directory:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```
#### SSH into VM:
```bash
$ gcloud compute ssh --zone "us-east4-c" "my-vm"  --project "jehad-iti"
```

#### Connect to cluster:
```bash
$ gcloud container clusters get-credentials cluster-pv --zone us-east4-c --project jehad-iti
```
#### To print Jenkines password:
```bash
$ kubectl exec --namespace jenkins -it svc/jenkins-service -c jenkins -- /bin/cat /var/jenkins_home/secrets/initialAdminPassword && echo
```
