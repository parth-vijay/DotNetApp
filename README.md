# .Net Application

## Before you install .NET, run the following commands to add the Microsoft package signing key to your list of trusted keys and add the package repository.
    wget https://packages.microsoft.com/config/ubuntu/21.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
    sudo dpkg -i packages-microsoft-prod.deb
    rm packages-microsoft-prod.deb

## Install the SDK:
    sudo apt-get update
    sudo apt-get install -y apt-transport-https
    sudo apt-get install -y dotnet-sdk-6.0

## Install the runtime:
    sudo apt-get install -y aspnetcore-runtime-6.0
    sudo apt-get install -y dotnet-runtime-6.0
    dotnet --help

## Create ASP.Net App:
    dotnet new webapp -o DotNetApp --no-https

## Run your App:
    cd DotNetApp
    dotnet watch

## Publish the app for production:
    dotnet publish -c Release -o out
    dotnet out/DotNetApp.dll

# Installing terraform

## For Ubuntu/Debian:

### Add the HashiCorp GPG key.

    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

### Add the official HashiCorp Linux repository.
    sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

### Update and install.
    sudo apt-get update && sudo apt-get install terraform

## For CentOS/RHEL:

### Install yum-config-manager to manage your repositories.
    sudo yum install -y yum-utils

### Use yum-config-manager to add the official HashiCorp Linux repository.
    sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

### Install.
    sudo yum -y install terraform

## For Amazon Linux:

### Install yum-config-manager to manage your repositories.
    sudo yum install -y yum-utils

### Use yum-config-manager to add the official HashiCorp Linux repository.
    sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo

### Install.
    sudo yum -y install terraform

## For MacOS:

### First, install the HashiCorp tap, a repository of all our Homebrew packages.
    brew tap hashicorp/tap

### Now, install Terraform with hashicorp/tap/terraform.
    brew install hashicorp/tap/terraform

### To update to the latest, run.
    brew upgrade hashicorp/tap/terraform

## Horizontal Auto Scale in minikube:
    minikube addons list
    minikube addons enable metrics-server
    kubectl get pod,svc -n kube-system
    kubectl autoscale deployment <DEPLOYMENT_NAME> --cpu-percent=50 --min=1 --max=10
    kubectl get hpa

## Increase the load:
    kubectl run -i --tty load-generator --rm --image=busybox --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://192.168.59.100:32462/; done"