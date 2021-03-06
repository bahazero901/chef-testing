#
# Cookbook:: chef-server
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package_url = node['enterprise-chef']['url']
#ruby code that takes the basename
package_name = ::File.basename(package_url)
#location of the installer
package_local_path = "#{Chef::Config[:file_cache_path]}/#{package_name}"

# omnibus_package is remote (i.e., a URL) let's download it
remote_file package_local_path do
  source package_url
end

package package_name do
  source package_local_path
  provider Chef::Provider::Package::Rpm
  notifies :run, 'execute[reconfigure-chef-server]', :immediately
end

# reconfigure the installation
execute 'reconfigure-chef-server' do
  command 'private-chef-ctl reconfigure'
  action :nothing
end
