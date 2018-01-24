rancher_ng_server node['rancher_ng']['server']['name'] do
  port node['rancher_ng']['server']['port']
  action :create
end
