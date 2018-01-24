# # encoding: utf-8

# Inspec test for recipe rancher-ng::agent

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe group('docker') do
  it { should exist }
end

describe command('/usr/bin/docker ps') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match(/hello_world_agent/) }
end
