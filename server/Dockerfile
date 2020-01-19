# build and serve
FROM node:11.13.0
WORKDIR /app
COPY package.json ./
COPY yarn.lock ./
RUN yarn install
COPY . .
RUN yarn build
EXPOSE 5000
CMD ["yarn", "serve"]
