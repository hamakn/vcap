#
# Cookbook Name:: node
# Recipe:: default
#
# Copyright 2011, VMware
# Copyright 2012, NTT Communications
#

cloudfoundry_service "postgresql" do
  components ["postgresql_node"]
end

cf_pg_update_hba_conf(node[:postgresql][:database], node[:postgresql][:server_root_user], true)
cf_pg_setup_db(node[:postgresql][:database], node[:postgresql][:server_root_user], node[:postgresql][:server_root_password], true)
