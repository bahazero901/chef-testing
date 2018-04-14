# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html

#variables uses in the custom resource
property :site_name, String, name_property: true
property :title, String

action :start do
  directory "/var/www/#{site_name}" do
    recursive true
    mode 0755
    user 'earlwaud'
    group 'wheel'
    action :create
  end

  file "/var/www/#{site_name}/index.html" do
    content "<html><title>#{title}</title><body><h1>Hello to our\
    #{title}</h1></body></html>"
    mode 0755
    user 'earlwaud'
    group 'wheel'
    notifies :restart, 'service[httpd]'
  end

  service 'httpd' do
    action :nothing
  end 
end

