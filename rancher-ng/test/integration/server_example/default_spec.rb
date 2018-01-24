# # encoding: utf-8

# Inspec test for recipe test::server_example

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe group('docker') do
  it { should exist }
end

describe command('/usr/bin/docker ps') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match(/rancher/) }
end

describe port(8080) do
  it { should be_listening }
end
