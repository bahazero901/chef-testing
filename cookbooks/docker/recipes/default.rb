#
# Cookbook:: containerization
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package "Install Docker" do
  case node[:platform]
  when 'redhat', 'centos'
    package_name 'docker'
  when 'ubuntu', 'debian'
    package_name 'docker-io'
  end  
  notifies :enable, 'service[docker]'
end

service 'docker' do
  action [:nothing]
  #action [:start, :enable]
end

exexute 'setenforce 0' do
  only_if 'getenforce | grep Enforcing'
end
