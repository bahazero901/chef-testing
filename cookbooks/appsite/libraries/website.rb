#subclassing a custom resource

module AppsiteCookbook
 class Website < Chef::Resource
   resource_name :appsite_website
 end 
end
