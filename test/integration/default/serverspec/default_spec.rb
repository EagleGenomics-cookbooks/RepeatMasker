require 'serverspec'
require_relative './spec_helper'

# Required by serverspec
set :backend, :exec

describe file("#{ENV['REPEATMASKER_DIR']}") do
  it { should be_directory }
end

describe command('which RepeatMasker') do
  its(:exit_status) { should eq 0 }
end

version = ENV['REPEATMASKER_VERSION'].gsub(/\-/, '.')

describe command('RepeatMasker -h') do
  its(:stdout) { should contain(version) }
end
