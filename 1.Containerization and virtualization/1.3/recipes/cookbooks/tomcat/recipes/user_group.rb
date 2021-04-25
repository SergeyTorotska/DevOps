user "cloud" do
	comment 'Tomcat User'
	shell '/bin/nologin'
end


group "students" do
	members 'cloud'
end

directory "/var/tmp/downloads" do
	owner 'cloud'
	group 'students'
	mode '755'
end

directory "/Apache_Tomcat" do
        owner 'cloud'
        group 'students'
        mode '755'
end

directory "/Apache_Tomcat/TOMCAT" do
        owner 'cloud'
        group 'students'
        mode '755'
end

