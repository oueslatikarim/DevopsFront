FROM node:12-alpine as builder
WORKDIR /app
COPY package*.json /app/
RUN npm install 
COPY ./ /app/
RUN node_modules/.bin/ng build --output-path=dist --prod=true



# Run Stage
FROM nginx:1.17.1-alpine
COPY default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/dist/comp-lib /usr/share/nginx/html