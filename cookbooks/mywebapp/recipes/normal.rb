#
# Cookbook:: mywebapp
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

node.default['webapp']['user'] = 'earlwaud'
node.default['webapp']['group'] = 'wheel'


#mkdir -p /var/www/users
directory '/var/www/users' do
  recursive true
  mode 0755
  user 'earlwaud'
  group 'wheel'
  action :create
end

file '/var/www/users/index.html' do
  content '<html><title>Users</title><body><h1>Hello to our Users</
   h1></body></html>'
  mode 0755
  user 'earlwaud'
  group 'wheel'  
  notifies :restart, 'service[httpd]'
end

directory '/var/www/suppliers' do
  recursive true
  mode 0755
  user 'earlwaud'
  group 'wheel'
  action :create
end

file '/var/www/suppliers/index.html' do
  content '<html><title>Suppliers</title><body><h1>Hello to our
  Suppliers</h1></body></html>'
  mode 0755
  user 'earlwaud'
  group 'wheel'
  notifies :restart, 'service[httpd]'
end
   
directory '/var/www/customers' do
  recursive true
  mode 0755
  user 'earlwaud'
  group 'wheel'
  action :create
end  

file '/var/www/customers/index.html' do
  content '<html><title>Customers</title><body><h1>Hello to our
Customers</h1></body></html>'
  mode 0755
  user 'earlwaud'
  group 'wheel'
  notifies :restart, 'service[httpd]'
end

service 'httpd' do
  action :nothing
end
