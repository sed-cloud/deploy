module.exports = {
  apps: [{
    name: `${process.env.REPO_NAME}`,
    script: "startup.sh",
    interpreter: '/bin/bash'
    env: {
      ...process.env
    }
  }],
  deploy : {
    production : {
      user: process.env.SED_CLOUD_USER,
      host: process.env.SED_CLOUD_HOST,
      ref: 'origin/main',
      key: 'deploy.key',
      repo: `https://github.com/${process.env.REPO_OWNER}/${process.env.REPO_NAME}.git`,
      path: `/home/${process.env.SED_CLOUD_USER}/${process.env.REPO_NAME}`,
      'post-deploy': "docker-compose build && pm2 reload ecosystem.config.js --env production",
      env: {
        ...process.env
      }
    }
  }
};
