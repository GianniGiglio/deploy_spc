require 'rexml/document'

## get current version from the pom file
#file = File.new('pom.xml')
#doc = REXML::Document.new file
#version_element = REXML::XPath.first(doc, '//project/version')
set :stage, :local
set :feature_url, "mvn:com.melexis.spc4mlx2.spc/spc-feature/1.16-SNAPSHOT/xml/features" 
set :features_mdp, ['spc-engine', 'spc-settings']
set :features_esb_colo, ['spc-settings']
set :version, "1.16-SNAPSHOT"
server '192.168.33.11',
    user: 'smx',
    roles: %w{mdp_erfurt},
    ssh_options:
        { auth_methods: ["password"],
          password: 'smx',
          port: 8101,
          paranoid: false
        }
 