FROM node:alpine
ENV HOME /usr/src/app
WORKDIR ${HOME}
COPY package.json ${HOME}
RUN npm install -g npm@latest && npm cache clean --force && rm -rf node_modules && rm -f package-lock.json
RUN npm install
RUN npm install vite
COPY . ${HOME}
# EXPOSE port mentioned in vite
EXPOSE 5173
CMD [ "npm","run","dev" ]