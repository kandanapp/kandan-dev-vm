Kandan Development VM
===============

Overview
--------
This repository manages Kandans's development virtual server. This project will provide an environment to easily stand up a developer instance for DEV and QA purposes. This project is currently used for testing the Kandan Application.

Prerequisites 
------------
You must have (at minimum) the following software installed:

* [Ruby 1.9.3+](http://www.ruby-lang.org/en/downloads/) (or use [RVM](https://rvm.io/rvm/install))
* [Vagrant](http://vagrantup.com)
* [VirtualBox](http://www.virtualbox.org)

### NOTE: VirtualBox 4.2.14 has issues on OSX with Vagrant. Please download and use 4.2.12 located [here](https://www.virtualbox.org/wiki/Download_Old_Builds_4_2)

VirtualBox versions 4.0.x, 4.1.x, and 4.2.x are supported. Any other version is unsupported and will display an error message.

As an alternative to VirtualBox you can also use either (depending on your operating system):

* [VMware Fusion](http://www.vmware.com/products/fusion/overview.html)
* [VMware Workstation](http://www.vmware.com/products/workstation/)

VMware is a drop-in replacement for VirtualBox, meaning that every VirtualBox feature that Vagrant supports is fully functional in VMware as well. 

VMware support  is currently compatible only with Fusion 5/6 or Workstation 9. Fusion and Workstation must be purchased and installed separately prior to using.

Usage
--------

Once the repositories have been downloaded run "vagrant up" from within this
directory. This will build the virtual server and provision it. You can change
some settings such as the IP address of the server and the server's name in the
VagrantFile.

After the server has been built it is a good idea to update the packages. Log in
to the server over SSH. The username and password are both "vagrant". 

You should now have a working Virtual Server.

The default server hostname is `kandan.dev` and the default IP is `10.15.15.10`.
