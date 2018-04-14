#
# Cookbook:: basic
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

["wget", "curl", "tree"].each do |tool|
  package tool do
  end
end

group 'docker' do
  action :create
  append true
end
 
user 'mfeng' do
  comment "Matt's Admin account"
  home '/home/mfeng'
  group 'docker'
  shell '/bin/bash'
  password 'testing'
  action :create
end
