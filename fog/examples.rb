#!/usr/bin/env ruby

require 'pp'
require 'fog'

# //
# // fog examples, not meant to be executed!
# //


compute = Fog::Compute.new(
  :provider => 'AWS',
  :aws_access_key_id => '...',
  :aws_secret_access_key => '...',
  :region => "us-east-1"
)

# //
# // security groups 
# //

# // get owner_id
pp compute.security_groups.all

# // create group using owner_id
sgroup = compute.security_groups.new(name: "new_sg_name", description: "new_sg_description", owner_id: "owner_id")
sgroup.save

# // add in rules
sgroup = compute.security_groups.get("new_sg_name")

# // single port
srule = sgroup.authorize_port_range(22..22, {:cidr_ip => '192.168.0.0/16'})

# // all icmp
srule = sgroup.authorize_port_range(-1..-1, {:cidr_ip => '192.168.1.10/32', :ip_protocol => 'icmp'})

# // single udp
srule = sgroup.authorize_port_range(161..161, {:cidr_ip => '192.168.1.105/32', :ip_protocol => 'udp'})

# // allow another security group access to a port, ie: heroku
srule = sgroup.authorize_port_range(27017..27017, {:group => '098166147350:default'})

# // allow another security group access to a port range/protocol, ie: heroku
srule = sgroup.authorize_port_range(-1..-1, {:group => '098166147350:default', :ip_protocol => 'icmp'})


# //
# // security keys
# //

# // create a new key
# //   !!! must capture output and save. your only chance to get private key. !!!
new_key = compute.key_pairs.create(:name => "new_security_key")
pp new_key 


# // 
# // instance 
# //

# // select key for new servers
key_pair = compute.key_pairs.get("new_security_key")

# // create new instance 
server = compute.servers.new(flavor_id: "m1.medium", image_id: "ami-82fa58eb", key_pair: key_pair, groups: ["new_security_key"], availability_zone: "us-east-1a")
server.save

# // tag new instance
compute.tags.create(:key => "Name", :value => "New Server", :resource_id => server.id)

# // search for instance using tags
servers = compute.servers.all
servers = compute.servers.find_all{|s| s.tags["Name"] =~ /New Server/i}
pp servers

# // terminate instance
instance_id = "i-487c1434"
server = compute.servers.get(instance_id)
server.destroy
