apt_update 'update' if platform_family?('debian')

docker_service 'default' do
  action %i[create start]
end
