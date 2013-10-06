## Description

Vagrant puppet template to build an apache configuration with mutual certificate authentication on centos 6.4 x64

## Goal

Automate the building of a web server that implements mutual autentication with certificates

## Prerequisite

- A linux system with VirtualBox and vagrant packages installed
- Ensure your /etc/hosts has a vagrant.centos64 entry that resolves to 127.0.0.1
- Ensure following ports are free : 2222, 3000 and 3001
- To run the test, shunit2 package is needed

## Usage

    $ cd vagrant-puppet-http-client-cert-sample
    $ vagrant up
    $ ./bin/run-tests

Should connect to the server with http and https and check status code 200.

    $ vagrant halt

## Browser usage

- Import the client generated certificate (./ssl-data/client.p12) into your browser
- Browse https://vagrant.centos64:3001/ and accept the warning (self-generated server certificate)

## Process description

- Vagrant :
  - Downloads the base box (accounts : root/vagrant, vagrant/vagrant)
  - Customizes the vm
  - Install puppet and puppet modules
- Puppet :
  - Define iptables rules
  - Create certificate authority (have a look at [cert.conf](https://github.com/openhoat/vagrant-puppet-http-client-cert-sample/tree/master/ssl-data/cert.conf) to match your needs)
  - Create server certificate
  - Create client certificate
  - Configure and start apache


Enjoy !
