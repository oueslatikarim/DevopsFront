FROM node:14 as node
# FROM node:16.13.1
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# stage 2
FROM nginx:alpine
COPY --from=node app/dist/*  /usr/share/nginx/html