#!/bin/bash

env $(cat .env | grep -v \"#\" | xargs) npx pm2 deploy ecosystem.config.js production update 

if [[ $? -ne 0 ]]; then
  echo "Failed to update project, attempting setup"
  env $(cat .env | grep -v \"#\" | xargs) npx pm2 deploy ecosystem.config.js production setup 
fi 

if [[ $? -ne 0 ]]; then
  echo "Failed to setup project" 
  exit 1
fi 

exit 0 
