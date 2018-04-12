#
# Cookbook:: motd-attributes
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

node.default['motd-attributes']['message'] = "It's a wonderful day today!"
node.default['ipaddress'] = '1.1.1.1'
node.default['motd-attributes']['company'] = 'My Company'

pp node.debug_value('motd-attributes', 'company')
#if a attribute is called twice, the last one is used
include_recipe 'motd-attributes::message'
include_recipe 'motd-attributes::message'
pp node.debug_value('motd-attributes', 'company')

template '/etc/motd' do
  source 'motd.erb'
  mode '0644'
end
