#===================================================================================================================
# Description
#   Sets up helper scripts for starting/stopping processes
#
#===================================================================================================================

cookbook_file "#{node.scriptDir}/Tomee_Start.sh" do
	mode "755"
	owner node.user
        group node.group
	source "script/Tomee_Start.sh"
end

cookbook_file "#{node.scriptDir}/Tomee_Stop.sh" do
	mode "755"
	owner node.user
        group node.group
	source "script/Tomee_Stop.sh"
end

execute "#{node.serversDir}" do
	command "chmod -R 755 #{node.serversDir}"
	action :run
end
