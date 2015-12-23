require 'capistrano-karaf/install'
require 'capistrano/setup'
require 'capistrano-karaf'
include Install

namespace :upgrade do
	desc "Task description"
	task :mdpnodes do
		upgrade.mdpnodes_erfurt
		upgrade.mdpnodes_sofia
		upgrade.mdpnodes_sensors
	end

	task :print do
		on roles(:mdp_erfurt) do
			puts "success"
		end	
	end

	task :mdpnodes_erfurt do
		on roles(:mdp_erfurt) do
			features_mdp= fetch :features_mdp
			upgrade_all_features "#{fetch :feature_url}", features_mdp, "#{fetch :version}" 
		end	
	end

	task :mdpnodes_sofia do
		on roles(:mdp_sofia) do

		end	
	end

	task :mdpnodes_sensors do
		on roles(:mdp_sensors) do

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
			      :feature_url => feature_url,
            	  :feature => feature,
              	  :version => version,
                  :condition => :gt
             }])	
	end
end