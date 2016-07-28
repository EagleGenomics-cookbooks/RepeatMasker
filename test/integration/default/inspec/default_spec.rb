describe file('/usr/local/RepeatMasker') do
  it { should be_directory }
end

describe command('which RepeatMasker') do
  its(:exit_status) { should eq 0 }
end

describe command('RepeatMasker -h') do
  its('stdout') { should match(/RepeatMasker version open-4.0.5/) }
end
