%w[sasl2-bin libsasl2-dev libevent-1.4-2 libevent-dev].each do |pkg|
    package pkg
end

remote_file File.join("", "tmp", "memcached-#{node[:memcached][:version]}.tar.gz") do
  owner node[:deployment][:user]
  source "http://memcached.googlecode.com/files/memcached-#{node[:memcached][:version]}.tar.gz"
  not_if { ::File.exists?(File.join("", "tmp", "memcached-#{node[:memcached][:version]}.tar.gz")) }
end

directory "#{node[:memcached][:path]}" do
  owner node[:deployment][:user]
  group node[:deployment][:user]
  mode "0755"
end

%w[bin etc var].each do |dir|
  directory File.join(node[:memcached][:path], dir) do
    owner node[:deployment][:user]
    group node[:deployment][:user]
    mode "0755"
    recursive true
    action :create
  end
end

bash "Install Memcached" do
  cwd File.join("", "tmp")
  user node[:deployment][:user]
  code <<-EOH
  tar xzf memcached-#{node[:memcached][:version]}.tar.gz
  cd memcached-#{node[:memcached][:version]}
  ./configure --enable-sasl --enable-64bit
  make
  cp memcached memcached-debug #{File.join(node[:memcached][:path], "bin")}
  EOH
  not_if do
    ::File.exists?(File.join(node[:memcached][:path], "bin", "memcached"))
  end
end

# for sasl
if node[:memcached][:sasl_user]
  group "sasl" do
    members [node[:memcached][:sasl_user]]
  end
end
