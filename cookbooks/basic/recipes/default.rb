#
# Cookbook:: basic
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

["wget", "curl", "tree"].each do |tool|
  package tool do
  end
end

execute 'setenforce 0' do
  only_if 'getenforce | grep Enforcing'
end


