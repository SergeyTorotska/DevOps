# include_recipe 'apt'

package 'mysql-client'

package 'mysql-server'


service 'mysql' do
  action :enable
end

service 'mysql' do
  action :start
end

execute 'assign root password' do
  command "/usr/bin/mysqladmin -u root password \"#{node["mysql"]["server_root_password"]}\""
  action :run
#   only_if "/usr/bin/mysql -u root -e 'show databases;'"
end