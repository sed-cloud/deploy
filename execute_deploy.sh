#!/bin/bash

if (( npx pm2 describe ${{ inputs.repo-name }} -eq 1 )) ; then 
  env $(cat .env | grep -v \"#\" | xargs) npx pm2 deploy ${{ github.action_path }}/ecosystem.config.js production setup 
else
  env $(cat .env | grep -v \"#\" | xargs) npx pm2 deploy ${{ github.action_path }}/ecosystem.config.js production update 
fi
      
      
      
      
