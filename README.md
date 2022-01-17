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