#
# Chef Documentation
# https://docs.chef.io/libraries.html
#

#
# This module name was auto-generated from the cookbook name. This name is a
# single word that starts with a capital letter and then continues to use
# camel-casing throughout the remainder of the name.
#
module Basic
  module IpaddressHelpers
    #
    # Define the methods that you would like to assist the work you do in recipes,
    # resources, or templates.
    #
    # def my_helper_method
    #   # help method implementation
    # end
  end
end
require "ipaddress"

#takes a IP and returns the netmask 
#to be used in the recipes
class Chef::Recipe
  def netmask(ipaddress)
    IPAddress(ipaddress.netmask)
  end
end
#
# The module you have defined may be extended within the recipe to grant the
# recipe the helper methods you define.
#
# Within your recipe you would write:
#
#     extend Basic::IpaddressHelpers
#
#     my_helper_method
#
# You may also add this to a single resource within a recipe:
#
#     template '/etc/app.conf' do
#       extend Basic::IpaddressHelpers
#       variables specific_key: my_helper_method
#     end
#
