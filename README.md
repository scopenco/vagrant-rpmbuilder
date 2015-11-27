# Vagrant RPM Build Environment

### Desciprion

This Vagrant Environment for rpm build on CentOS 6.

### Requirments

* [Parallels Desktop for Mac Pro Edition](http://www.parallels.com/products/desktop/download/) or VirtualBox
* [Vagrant](https://www.vagrantup.com/downloads.html) 1.7.0 or higher
* Vagrant plugins: `vagrant-parallels`, `vagrant-berkshelf`

### Usage
1. Clone git repository and run ```vagrant up```
2. Login to VM ```vagrant ssh```
3. ```cd /opt/rpmbulder```
4. Create or clone git repository with spec and sources and run builder script ```./rpmbuild-6-x86_64.sh```. Place source files in the same directory with spec file.


### Authors

* Author:: Andrei Skopenko (andrei@skopenko.net)
