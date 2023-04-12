# build stage
FROM node:current-buster as build-stage
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . .
CMD ["npm", "run", "test"]
RUN npm run build

# production stage
#FROM nginx:stable-alpine as production-stage
#COPY --from=build-stage /app/dist /usr/share/nginx/html
#EXPOSE 80
#CMD ["nginx", "-g", "daemon off;"]