#
# Cookbook Name:: gateway
# Recipe:: default
#
# Copyright 2011, VMware
#           2012, NTT Communications
#

cloudfoundry_service "postgresql" do
  components ["postgresql_gateway"]
end
