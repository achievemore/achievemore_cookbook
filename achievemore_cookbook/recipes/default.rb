#
# Cookbook:: achievemore_cookbook
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node.default['packages-cookbook'] = [
  'nodejs',
  'libmysqlclient-dev',
  'redis-server',
  'imagemagick',
  'memcached',
  'language-pack-pt',
  'monit',
  'cmake'
]

include_recipe 'achievemore_cookbook::libgraphql_install'
