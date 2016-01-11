require 'rexml/document'

## get current version from the pom file
#file = File.new('pom.xml')
#doc = REXML::Document.new file
#version_element = REXML::XPath.first(doc, '//project/version')
set :stage, :local
set :feature_urls, ['mvn:com.melexis.spc4mlx2.spc/spc-feature/1.17.0-SNAPSHOT/xml/features','mvn:com.melexis.spc4mlx2/spc4mlx2-repo/1.17.0-SNAPSHOT/xml/features']
set :features_mdp, ['jackson-jaxrs-json','dependenciesmdp','spc4mlx2common','akkalib','akkautil','mdplib','agentnode','spc4mlx2statsgen','spc-engine']
set :features_esb_colo, ['spc-settings']
set :version, "1.17"
server '192.168.33.11',
    user: 'smx',
    roles: %w{mdp_erfurt},
    ssh_options:
        { auth_methods: ["password"],
          password: 'smx',
          port: 8101,
          paranoid: false
        }
 