#
# Cookbook Name:: storm
# Recipe:: supervisor
#
# Copyright (C) 2013 Fewbytes
# 
Chef::Log.info ("JLK running storm::nimbus")
Chef::Log.info ("JLK include recipe 'storm' in storm::nimbus")
include_recipe "storm"

runit_service "storm-ui" do
	run_template_name "storm"
	log_template_name "storm"
	options :daemon => "ui"
	subscribes :restart, "template[#{::File.join(node["storm"]["conf_dir"], "storm.yaml")}]"
end

runit_service "storm-nimbus" do
	run_template_name "storm"
	log_template_name "storm"
	options :daemon => "nimbus"
	subscribes :restart, "template[#{::File.join(node["storm"]["conf_dir"], "storm.yaml")}]"
end
