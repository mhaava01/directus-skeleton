FROM directus/directus:10.4.0

USER root
RUN corepack enable \
 && corepack prepare pnpm@8.7.6 --activate

# USER node
# RUN pnpm install directus-extension-flow-manager

# Install Nodemon globally
RUN npm install -g nodemon

# Switch back to the 'node' user
USER node

# CMD to start Directus with Nodemon
CMD ["nodemon", "--watch", "extensions/", "--exec", "node /directus/cli.js start"]
