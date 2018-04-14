#
# Cookbook:: appsite
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package 'httpd' do
end

user 'earlwaud' do
  action :create
end

appsite_website 'customers' do
  title 'Customers'
end

