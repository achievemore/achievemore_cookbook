tar_location = "#{Chef::Config['file_cache_path']}/#{node['libgraphql']['source_url']}"

remote_file tar_location do
  source node['libgraphql']['source_url']
end

bash 'extract_libgraphql' do
  cwd  ::File.dirname(tar_location)
  user 'root'
  code <<-EOH
    tar -xzvf #{::File.basename(tar_location)}
    cd libgraphqlparser-#{node['libgraphql']['version']}/
    cmake .
    make
    make install
  EOH
  not_if { ::File.dirname(tar_location) }
end
