set :application, "railsbridge-site"
set :repository,  "git@papaya.larkware.com:railsbridge-site.git"
set :user, "webadmin"
set :deploy_via, :fast_remote_cache
set :scm, :git

# Customise the deployment
set :tag_on_deploy, false # turn off deployment tagging, we have our own tagging strategy

set :keep_releases, 6
after "deploy:update", "deploy:cleanup"

# directories to preserve between deployments
# set :asset_directories, ['public/system/logos', 'public/system/uploads']
    
# Gem dependencies - not needed with config.gem?
# depend :remote, :gem, "authlogic",            "=2.0.14"
# depend :remote, :gem, "mislav-will_paginate", "=2.2.3"
# depend :remote, :gem, "jscruggs-metric_fu",   "=1.0.2"
