#
# Cookbook:: rancher-ng
# Spec:: server
#
# Copyright (C) 2017 Alexander Merkulov
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'spec_helper'

describe 'rancher-ng::server' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04') do |node|
      node.normal['rancher_ng']['server']['name'] = 'hello-world'
    end.converge(described_recipe)
  end

  context 'When all attributes are default, on an unspecified platform' do
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end

  context 'testing create action' do
    it 'create rancher_server[hello-world]' do
      expect(chef_run).to create_server('hello-world').with(
        image: 'rancher/server',
        version: 'v1.6.7',
        db_dir: '/var/opt/rancher_db',
        port: '8080',
        detach: true,
        restart_policy: 'unless-stopped'
      )
    end
  end
end
