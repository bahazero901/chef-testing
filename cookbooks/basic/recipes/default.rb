#
# Cookbook:: basic
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

["wget", "curl", "tree"].each do |tool|
  package tool do
  end
end

ip = '10.10.0.0/24' 
mask = netmask(ip) # here we use the library method as define in the class Chef::Recipe (extending Recipe Chef)
Chef::Log.info("Netmask of #{ip}: #{mask}") 

