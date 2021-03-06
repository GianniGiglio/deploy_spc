require 'capistrano-karaf/install'
require 'capistrano/setup'
require 'capistrano-karaf'
include Install

namespace :upgrade do

	task :mdpnodes_erfurt do
		on roles(:mdp_erfurt) do
			features_mdp= fetch :features_mdp
			upgrade_all_features "#{fetch :feature_url}", features_mdp, "#{fetch :version}" 
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

	def upgrade_all_features(feature_url,features,version)
		features.each do |feature|
		puts feature	
		upgrade_feature(feature_url,feature,version)
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
end