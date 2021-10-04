#!/bin/bash
# npx pm2 describe $1
# if [[ $? -eq 1 ]] ; then 
#   echo $1 does not exist running setup 
#   env $(cat .env | grep -v \"#\" | xargs) npx pm2 deploy $2/ecosystem.config.js production setup 
# else
#   echo $1 does exist running update 
env $(cat .env | grep -v \"#\" | xargs) npx pm2 deploy $2/ecosystem.config.js production update 
# fi
exit 0 
      
      
