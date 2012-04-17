include_attribute "deployment"
default[:memcached][:version] = "1.4.9"
default[:memcached][:path] = File.join(node[:deployment][:home], "deploy", "memcached")
default[:memcached][:runner] = node[:deployment][:user]
default[:memcached][:port] = 11211
default[:memcached][:password] = "memcached"
default[:memcached][:daemonize] = "no"

default[:memcached_node][:capacity] = "200"
default[:memcached_node][:index] = "0"
default[:memcached_node][:available_memory] = "4096"
default[:memcached_node][:max_memory] = "16"
default[:memcached_node][:max_swap] = "32"
default[:memcached_node][:token] = "changememcachedtoken"
default[:memcached_node][:max_clients] = "500"
default[:memcached_node][:memcached_timeout] = "2"

default[:memcached_gateway] = {}
