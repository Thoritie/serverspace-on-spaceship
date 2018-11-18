require 'spec_helper'

describe port(80) do
  it { should be_listening }
end

describe service('nginx'), :if =>os[:family] == 'ubuntu' do
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/nginx/sites-available/spaceship.co.conf') do
  it { should contain 'server_name spaceship.co' }
end

describe file('/etc/nginx/sites-enabled/spaceship.co.conf') do
  it { should be_symlink }
end

describe host('spaceship.co') do
  it { should be_reachable }
  its(:ipaddress) { should eq '127.0.0.1' }
end

describe file('/etc/nginx/sites-available/spaceship.co.conf') do
  it { should exist }
end
