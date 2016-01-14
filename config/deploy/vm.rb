require 'rexml/document'

## get current version from the pom file
#file = File.new('pom.xml')
#doc = REXML::Document.new file
#version_element = REXML::XPath.first(doc, '//project/version')
set :stage, :local
set :feature_urls, ['mvn:com.melexis.spc4mlx2/spc4mlx2-repo/1.17.0-SNAPSHOT/xml/features']
set :features_mdp, ['dependenciesmdp','spc-dep', 'jackson-jaxrs-json','dependenciesmdp','spc4mlx2common','akkalib','akkautil','mdplib','agentnode','spc4mlx2statsgen','local-api']
set :features_colo, ['spc-dep','jackson-jaxrs-json','spc4mlx2common','spc4mlx2frontendservice','testingevent']
set :features_supervisor, ['spc-dep','spc4mlx2common','akkalib','akkautil','supervisornode']
set :version, "1.17"
server '192.168.33.11',
    user: 'smx',
    roles: %w{esb_colo mdp_sensors mdp_sofia mdp_erfurt supervisor},
    ssh_options:
        { auth_methods: ["password"],
          password: 'smx',
          port: 8101,
          paranoid: false
        }
 