# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html

property :homepage, String, default: '<h1>Hello World</h1>'

action :create do
  package 'httpd'
  
  service 'httpd' do
    action [:enable, :start]
  end

  file '/var/www/html/index.html' do
    content homepage
  end

action :delete do
  package 'httpd' do
    action :delete
  end
end
