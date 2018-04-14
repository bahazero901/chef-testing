#recipe using a custom resource

package 'httpd' do
end

user 'earlwaud' do
  action :create
end


#playbook-name_custom-resourcename
mywebapp_website 'users' do
  title 'Users'
end

mywebapp_website 'suppliers' do
  title 'Customers'
end

mywebapp_website 'customers' do
  title 'Customers'
end
