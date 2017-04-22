# Vagrant RPM Build Environment

### Desciprion

This Vagrant Environment for rpm build on CentOS 6.
Support build rpms for
* CentOS 6
* CentOS 7

### Requirments

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads) or [Fusion](https://www.vmware.com/go/downloadfusion) or [Parallels Desktop for Mac Pro Edition](http://www.parallels.com/products/desktop/download/)
* [Vagrant](https://www.vagrantup.com/downloads.html) 1.7.0 or higher
* [ChefDK](https://downloads.chef.io/chefdk/1.3.43)

### Usage
1. Provision local VM with Vagrant
```bash
git clone https://github.com/scopenco/vagrant-rpmbuilder.git
cd vagrant-rpmbuilder
vagrant up
```
2. ```vagrant ssh```
3. ```cd /opt/rpmbulder```
4. Create or clone git repository with spec file and sources and run builder script ```./rpmbuild-6-x86_64.sh```. Place source files in the same directory with spec file.

### Authors

* Author:: Andrei Skopenko (andrei@skopenko.net)
