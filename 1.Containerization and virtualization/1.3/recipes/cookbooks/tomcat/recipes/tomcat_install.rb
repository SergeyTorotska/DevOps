#===================================================================================================================
# Description
#   Downloads and extracts the the TomEE distribution
#   Gives ownership to specified user
#   Sets up the CATALINA_HOME environment variable
#
#===================================================================================================================


user = node.user
group = node.group || user


downloadUrl = node['tomcat_url']
archiveFile = node['archiveFile']
archiveDir = node.archiveDir

serversDir = node.serversDir

tomcatHomeDir = node['tomcatHomeDir']

if !::File.exists?("#{serversDir}/#{tomcatHomeDir}")

  # archive
  remote_file "#{archiveDir}/#{archiveFile}" do 
    source "#{downloadUrl}"
  end

  # Extract archive
  execute 'extract archive' do
    command "unzip #{archiveDir}/#{archiveFile} -d #{serversDir}"
    action :run
  end 

  # Change owner ship
  execute 'change access rights' do
    command "chown -R #{user}:#{group} #{serversDir}"
    action :run
  end 


  execute 'rename tomcat directory' do
    command "mv  #{serversDir}/apache-tomcat-8.5.9/* #{serversDir}/#{tomcatHomeDir}/"
    action :run
  end 

 execute 'rename tomcat directory' do
    command "rm -rf  #{serversDir}/apache-tomcat-8.5.9"
    action :run
  end

end

# Export tomcat install directory

ruby_block "export CATALINA_HOME" do
  block do

    line = "\nexport CATALINA_HOME=#{serversDir}/#{tomcatHomeDir}\n"

    file = Chef::Util::FileEdit.new("#{node.envFile}")
    file.insert_line_if_no_match('CATALINA_HOME', "#{line}")
    file.write_file
  end
end
