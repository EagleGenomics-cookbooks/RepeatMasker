#
# Cookbook Name:: RepeatMasker
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
##########################################################

include_recipe 'build-essential'
include_recipe 'TRF'
include_recipe 'HMMER'

##########################################################
# here for use by serverspec

magic_shell_environment 'RepeatMasker_VERSION' do
  value node['RepeatMasker']['version']
end

##########################################################
# package install

package ['zlib-devel'] do
  action :install
end

##########################################################
# main recipe

remote_file "#{Chef::Config[:file_cache_path]}/#{node['RepeatMasker']['filename']}" do
  source node['RepeatMasker']['url']
  action :create_if_missing
end

remote_file "#{Chef::Config[:file_cache_path]}/#{node['RepeatMasker']['dfamFilename']}" do
  source node['RepeatMasker']['dfamUrl']
  action :create_if_missing
end

execute 'un-tar RepeatMasker tar ball' do
  command "tar zxvf #{Chef::Config[:file_cache_path]}/#{node['RepeatMasker']['filename']} -C #{node['RepeatMasker']['install_dir']}"
  not_if { ::File.exist?("#{node['RepeatMasker']['dir']}/README") }
end

execute 'gunzip Dfam file' do
  command "gzip -dc #{Chef::Config[:file_cache_path]}/#{node['RepeatMasker']['dfamFilename']} > #{node['RepeatMasker']['dir']}/Libraries/Dfam.hmm"
end

#execute 'perl ./configure' do
#  cwd "#{node['RepeatMasker']['dir']}"
#end



##########################################################
##########################################################
