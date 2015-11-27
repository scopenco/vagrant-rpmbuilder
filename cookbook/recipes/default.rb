#
# Cookbook Name:: nsca
# Recipe:: default
#
# Copyright 2015 Andrei Skopenko
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'yum-epel'

package ['curl', 'mock', 'git', 'vim-enhanced', 'bash-completion', 'rpmdevtools']

# Install yum group Development tools and Libraries
bash 'yum groupinstall Development tools' do
  user 'root'
  group 'root'
  code <<-EOC
    yum groupinstall 'Development tools' -y
  EOC
  not_if "yum grouplist installed | grep 'Development tools'"
end

# vagrant should be in shell group mock
group 'mock' do
  action :modify
  members 'vagrant'
  append true
end
