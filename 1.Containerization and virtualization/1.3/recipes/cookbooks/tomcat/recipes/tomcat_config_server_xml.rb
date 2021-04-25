#===================================================================================================================
# Description
#
#   Configures the TomEE server.xml with correct port numbers
#
#===================================================================================================================

catalina_home = node.serversDir

template "#{catalina_home}/#{node.tomcatHomeDir}/conf/server.xml" do

  variables :shutdown_port => node.shutdown_port,
            :port => node.port,
            :ssl_port => node.ssl_port,
            :ajp_port => node.ajp_port
  mode "755"
  owner node.user
  group node.group
  source "conf/server.xml.erb"
end
