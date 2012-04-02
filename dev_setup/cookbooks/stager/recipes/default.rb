#
# Cookbook Name:: stager
# Recipe:: default
#
%w{lsof psmisc librmagick-ruby}.each do |pkg|
    package pkg
end

template node[:stager][:config_file] do
  path File.join(node[:deployment][:config_path], node[:stager][:config_file])
  source "stager.yml.erb"
  owner node[:deployment][:user]
  mode 0644
end

cf_bundle_install(File.expand_path(File.join(node["cloudfoundry"]["path"], "stager")))

staging_dir = File.join(node[:deployment][:config_path], "staging")
node[:stager][:staging].each_pair do |framework, config|
  template config do
    path File.join(staging_dir, config)
    source "#{config}.erb"
    owner node[:deployment][:user]
    mode 0644
  end
end
