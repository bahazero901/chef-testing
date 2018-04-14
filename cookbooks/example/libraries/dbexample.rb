#
# Chef Documentation
# https://docs.chef.io/libraries.html
#

require 'sequel'

class Chef::Recipe::ISP
  # We can call this with ISP.vhosts
  def self.vhosts
    v = []
    @db = Sequel.mysql(
      'web',
      :user => 'example',
      :password => 'example_pw',
      :host => 'dbserver.example.com'
    )
    @db[
      "SELECT virtualhost.domainname,
           usertable.userid,
           usertable.uid,
           usertable.gid,
           usertable.homedir
       FROM usertable, virtualhost
       WHERE usertable.userid = virtualhost.user_name"
      ].all do |query|
      vhost_data = {
        :servername   => query[:domainname],
        :documentroot => query[:homedir],
        :uid          => query[:uid],
        :gid          => query[:gid],
      }
      v.push(vhost_data)
    end
    Chef::Log.debug('About to provision #{v.length} vhosts')
    v
  end
end
