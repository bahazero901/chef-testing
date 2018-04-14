#
# Cookbook:: example
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

#will go into custom library that connects to a database to pull data
#below receipe will take that info and create all the directories
ISP.vhosts.each do |vhost|
  directory vhost[:documentroot] do
    owner vhost[:uid]
    group vhost[:gid]
    mode '0755'
    action :create
  end

  directory "#{vhost[:documentroot]}/#{vhost[:domainname]}" do
    owner vhost[:uid]
    group vhost[:gid]
    mode '0755'
    action :create
  end
end
