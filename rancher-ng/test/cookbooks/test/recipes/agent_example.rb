rancher_ng_agent node['rancher_ng']['agent']['name'] do
  auth_url node['rancher_ng']['agent']['auth_url']
  action :create
end
