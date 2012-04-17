default[:postgresql][:server_root_password] = "changeme"
default[:postgresql][:server_root_user] = "cloudfoundry"
default[:postgresql][:database] = "pg_service"
default[:postgresql][:index] = "0"
default[:postgresql][:host] = "localhost"
default[:postgresql][:listen_address] = default[:postgresql][:host]

default[:postgresql_node][:capacity] = "50"
default[:postgresql_node][:index] = "0"
default[:postgresql_node][:max_db_size] = "20"
default[:postgresql_node][:available_storage] = "1024"
default[:postgresql_node][:token] = "changepostgresqltoken"
