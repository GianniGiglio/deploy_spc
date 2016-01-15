require 'capistrano-karaf/install'
require 'capistrano/setup'
require 'capistrano-karaf'
include Install

namespace :verify do
	task :mdp do
      on roles(:mdp_ieper,:mdp_sofia,:mdp_erfurt) do |host|
      	if all_bundles_started? fetch :mdp_bundles
            puts "All expected bundles are correctly installed on host: " + host 
      	end
      end
    end

    task :colo do
      on roles(:esb_colo) do |host|
      	if all_bundles_started? fetch :colo_bundles
  			puts "All expected bundles are correctly installed on host: " + host 
      	end
      end
  	end

	task :supervisor do
      on roles(:supervisor) do |host|
      if all_bundles_started? fetch :supervisor_bundles
          puts "All expected bundles are correctly installed on host: " + host 
      end
     end  
    end

    task :all do 
     on roles(:supervisor,:mdp,:esb_colo) do |host|
     	end
     end

     before 'verify:all','verify:mdp' 
     before 'verify:all','verify:colo'
     before 'verify:all','verify:supervisor'
end