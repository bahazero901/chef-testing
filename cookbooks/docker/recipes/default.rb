#
# Cookbook:: docker
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package 'docker' do
  notifies :start, 'service[docker]'
end

service 'docker' do
  #provider Chef::Provider::Service::Init
  action [:enable, :start]
end


