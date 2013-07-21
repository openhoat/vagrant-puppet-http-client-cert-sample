## Description

Vagrant puppet template to build an apache configuration with mutual certificate authentication on cent 6.4 x64

## Prerequisite

- A linux system with VirtualBox and vagrant packages installed
- Ensure your /etc/hosts has a vagrant.centos64 entry that resolves to 127.0.0.1
- Ensure following ports are free : 2222, 3000 and 3001

## Usage

    $ vagrant up
    $ ./bin/test-https

Should return a sample hello web page from the SSL apache server.

## Browser usage

- Import the client generated certificate (./ssl-data/client.p12) into your browser
- Browse https://vagrant.centos64:3001/ and accept the warning (self-generated server certificate)

## Process description

- Vagrant :
  - Downloads the base box
  - Customizes the vm
  - Executes a shell to install puppet and puppet modules
- Puppet :
  - Define iptables rules
  - Create certificate authority (have a look at ./bin/create-certificates to match your needs)
  - Create server certificate
  - Create client certificate
  - Configure and start apache

Enjoy !
