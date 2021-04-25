apt_update 'Update the apt cache daily' do
  frequency 86_400
  action :periodic
end
  
package node['nginx']['package']

service node['nginx']['service'] do
  supports status: true, restart: true, reload: true
  action %i(enable start)
end