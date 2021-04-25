default[:user] = 'cloud'
default[:group] = 'students'
default[:serversDir] = '/Apache_Tomcat'
default[:scriptDir] = '/var/tmp/script'
default[:archiveDir] = "/var/tmp/downloads"
#
default[:envFile] = "/home/cloud/.bashrc"
#
default["tomcat_url"] = "http://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.9/bin/apache-tomcat-8.5.9.zip"
default['archiveFile'] = "apache-tomcat-8.5.9.zip"
#
#
default["home"] = "/Apache_Tomcat/apps/SimpleWebApp"
#default["tomee"]["base"] = "/Apache_TomEE/rmk/apps/tomee"
default["tomcatHomeDir"] = "TOMCAT"
#
default["java_home"] = "/usr/lib/jvm/jdk1.7.0_75"
default["java_opts"] = "-Xmx1024m -XX:MaxPermSize=256m -server"
#
default["shutdown_port"] = 8005
default["port"] = 9090
default["ssl_port"] = 8443
default["ajp_port"] = 8009
