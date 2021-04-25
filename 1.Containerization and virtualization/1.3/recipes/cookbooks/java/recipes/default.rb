node["java"]["packages"].each do |name|
  package name do
    action :install
  end
end