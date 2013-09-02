#!/usr/bin/env ruby

# /////
# //
# // print out iops used per region
# //

require 'pp'
require 'fog'
require 'json'

# // sample json
#
# {
#   "aws_access_key_id": "",
#   "aws_secret_access_key": "",
# }
#

creds = ARGV[0]
json = File.read("#{creds}")
JSON.create_id = nil
j = JSON.parse(json)
aws_access_key_id = j["aws_access_key_id"]
aws_secret_access_key = j["aws_secret_access_key"]

zones = [ "us-east-1", "us-west-1", "us-west-2", "sa-east-1", "eu-west-1", "ap-southeast-1", "ap-southeast-2", "ap-northeast-1" ]

zones.each do |z|

  compute = Fog::Compute.new(
    :provider => 'AWS',
    :aws_access_key_id => aws_access_key_id,
    :aws_secret_access_key => aws_secret_access_key,
    :region => z
  )

  iops = 0

  compute.volumes.find_all do |v|
    if v.iops
      iops = v.iops + iops
    end
  end

  puts "[ #{z} ]: iops: #{iops}"

end
