require 'capistrano-karaf/install'
require 'capistrano/setup'
require 'capistrano-karaf'
include Install

namespace :install do

	task :nodes_colo do
		on roles(:esb_colo) do
			features_colo= fetch :features_colo
			add_features_url
			install_all_features features_colo
		end	
	end

	task :mdpnodes do
		on roles(:mdp_ieper,:mdp_sofia,:mdp_erfurt) do
			features_mdp= fetch :features_mdp
			add_features_url
			install_all_features features_mdp
		end	
	end

	task :supervisor do
		on roles(:supervisor) do
			features_supervisor= fetch :features_supervisor
			add_features_url
			install_all_features features_supervisor
		end	
	end

	task :uninstall do
			on roles(:mdp_ieper,:mdp_sofia,:mdp_erfurt,:supervisor,:esb_colo) do
			uninstall_all_features fetch :features_supervisor
			uninstall_all_features fetch :features_mdp
			uninstall_all_features fetch :features_colo
		end
	end	

	task :removeurl do
			on roles(:mdp_ieper,:mdp_sofia,:mdp_erfurt,:supervisor,:esb_colo) do
			remove_artifact_urls "com.melexis.spc4mlx2", "spc4mlx2-repo"
		end
	end	

	task :full do
		puts "Install all features for all nodes on all hosts"
	end

	task :vm do
		puts "Install all features for all nodes"
	end

	before 'install:full','install:nodes_colo' 
	before 'install:full','install:mdpnodes' 
	before 'install:full','install:supervisor'

	before 'install:vm','install:nodes_colo'
	before 'install:vm','install:mdpnodes'
	before 'install:vm','install:supervisor'
	after 'install:uninstall', 'install:removeurl'
 

	def install_all_features(features)
		features.each do |feature|
		feature_install feature
		end
	end

	def uninstall_all_features(features)
		features.each do |feature|
		feature_uninstall_safe feature
		end
	end

	def add_features_url
		features_urls = fetch :feature_urls
		puts features_urls
		features_urls.each do |url|
		add_url url
		end
	end
end