require 'capistrano-karaf/install'
require 'capistrano/setup'
require 'capistrano-karaf'
include Install

namespace :install do



	task :mdpnodes_erfurt do
		on roles(:mdp_erfurt) do
			features_mdp= fetch :features_mdp
			add_features_url
			install_all_features 
		end	
	end

	task :mdpnodes_sofia do
		on roles(:mdp_sofia) do
			features_mdp= fetch :features_mdp
			upgrade_all_features "#{fetch :feature_url}", features_mdp, "#{fetch :version}" 
		end	
	end

	task :mdpnodes_sensors do
		on roles(:mdp_sensors) do
			features_mdp= fetch :features_mdp
			upgrade_all_features "#{fetch :feature_url}", features_mdp, "#{fetch :version}" 
		end	
	end

	task :colonodes_sensors do
		on roles(:esb_colo) do
			features_mdp= fetch :features_mdp
			upgrade_all_features "#{fetch :feature_url}", features_mdp, "#{fetch :version}" 
		end	
	end

	task :nodes_sensors do
		on roles(:esb_colo) do
			features_mdp= fetch :features_mdp
			upgrade_all_features "#{fetch :feature_url}", features_mdp, "#{fetch :version}" 
		end	
	end

	def install_all_features
		features= fetch :features_mdp
		features.each do |feature|
		feature_install feature
		end
	end

	def upgrade_feature(feature_url,feature,version)
		upgrade([{
			      :groupId => "com.melexis.spc4mlx2.spc",
			      :repository => "spc-feature",
            	  :feature => "spc-engine",
              	  :version => "1.16.0-SNAPSHOT",
                  :condition => :latest
             }])	
	end

	def add_features_url
		features_urls = fetch :feature_urls
		puts features_urls
		features_urls.each do |url|
		add_url url
		end
	end
end