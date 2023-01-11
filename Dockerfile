FROM node:14

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm install --only=production

# Bundle app source
COPY . .

# Build the application
#RUN npm run build

EXPOSE 8787
#CMD [ "npm", "start" ]
CMD ["node", "index.js"]
