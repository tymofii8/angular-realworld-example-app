FROM node:16-alpine3.12 AS build
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.21.4-alpine
COPY nginx.conf /etc/nginx/conf.d/app.conf
COPY --from=build /app /usr/share/nginx/html
EXPOSE 80
