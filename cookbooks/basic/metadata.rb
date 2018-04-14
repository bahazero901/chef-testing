name 'basic'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'All Rights Reserved'
description 'Installs/Configures basic'
long_description 'Installs/Configures basic'
version '0.1.0'
#version of chef client 
chef_version '>= 12.14' if respond_to?(:chef_version)

#example depends on a cookbook version 1.0
#depends 'mysql', '>= 1.0'
# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/basic/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/basic'
