FROM node:11.13.0 as build
WORKDIR /app
COPY package.json ./
COPY yarn.lock ./
RUN yarn install
COPY . .
RUN yarn build

FROM nginx:1.16.1-alpine
RUN rm /etc/nginx/conf.d/default.conf
COPY --from=build /app/nginx.conf /etc/nginx/conf.d
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 3000
CMD ["nginx", "-g", "daemon off;"]
