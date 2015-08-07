#
# Cookbook Name:: RepeatMasker
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
##########################################################

include_recipe 'build-essential'
include_recipe 'TRF'
include_recipe 'RepeatMasker'

##########################################################
# here for use by serverspec

magic_shell_environment 'REPEATMASKER_VERSION' do
  value node['RepeatMasker']['version']
end

magic_shell_environment 'REPEATMASKER_DIR' do
  value node['RepeatMasker']['dir']
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

cookbook_file 'configureAnwsers.txt' do
  path "#{Chef::Config[:file_cache_path]}/configureAnwsers.txt"
  action :create
end

execute "perl ./configure < #{Chef::Config[:file_cache_path]}/configureAnwsers.txt" do
  cwd node['RepeatMasker']['dir']
end

execute 'create symbolic links in PATH to executable' do
  command "ln -s -f #{node['RepeatMasker']['dir']}/RepeatMasker ."
  cwd node['RepeatMasker']['install_dir'] + '/bin'
end

##########################################################
##########################################################
