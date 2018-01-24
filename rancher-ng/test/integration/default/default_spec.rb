# # encoding: utf-8

# Inspec test for recipe rancher-ng::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe port(8080) do
  it { should_not be_listening }
end

describe port(4500) do
  it { should_not be_listening }
end
