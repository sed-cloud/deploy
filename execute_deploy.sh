#!/bin/bash

if (( ${{ steps.main.outputs.OUTPUT }} -eq 1 )) ; then 
  env $(cat .env | grep -v \"#\" | xargs) npx pm2 deploy ${{ github.action_path }}/ecosystem.config.js production setup 
else
  env $(cat .env | grep -v \"#\" | xargs) npx pm2 deploy ${{ github.action_path }}/ecosystem.config.js production update 
fi
      
      
      
      
