tar_location = "#{Chef::Config['file_cache_path']}/#{node['libgraphql']['filename']}"
module_location = "#{Chef::Config['file_cache_path']}/libgraphql/#{node['libgraphql']['source_checksum']}"

remote_file tar_location do
  source node['libgraphql']['source_url']
  checksum node['libgraphql']['source_checksum']
end

directory module_location do
  mode      '0755'
  recursive true
  action    :create
end

bash 'extract_libgraphql' do
  cwd  ::File.dirname(tar_location)
  user 'root'
  code <<-EOH
    tar -xzvf #{::File.basename(tar_location)} -C #{module_location}
    cd #{module_location}/libgraphqlparser-#{node['libgraphql']['version']}/
    cmake .
    make
    make install
  EOH
  only_if { ::File.dirname(tar_location) }
end
