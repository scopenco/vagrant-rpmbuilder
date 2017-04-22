# Vagrant RPM Build Environment

### Desciprion

This Vagrant Environment for rpm build on CentOS 7.
Support build rpms for
* CentOS 6
* CentOS 7

### Requirments

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads) or [Fusion](https://www.vmware.com/go/downloadfusion) or [Parallels Desktop for Mac Pro Edition](http://www.parallels.com/products/desktop/download/)
* [Vagrant](https://www.vagrantup.com/downloads.html) 1.7.0 or higher

### Usage
1. Provision local VM with Vagrant
```bash
git clone https://github.com/scopenco/vagrant-rpmbuilder.git
cd vagrant-rpmbuilder
vagrant up
```
2. ```vagrant ssh```
3. ```cd /opt/rpmbulder```
4. Clone git repository with spec file and sources. Source files should be in the same directory with spec file
5. Run ```./rpmbuild-el7-x86_64.sh``` for CentOS 7 and ```./rpmbuild-el6-x86_64.sh``` for CentOS 6 to build rpm package, for example
```bash
./rpmbuild-el7-x86_64.sh  /path/to/file.spec
```

## Contributing
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
6. Submit a Pull Request using Github

## License & Authors
* Author:: Andrei Skopenko (andrei@skopenko.net)

```text
Copyright:: 2016-2017 Andrei Skopenko

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
