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
  notify :run, 'service[docker]', :immediately
end

service 'docker' do
  action [:nothing]
  #action [:start, :enable]
end
