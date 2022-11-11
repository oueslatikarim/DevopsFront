FROM node:14 as build
WORKDIR /app
COPY package*.json /app/
RUN npm install 
COPY ./ /app/
RUN node_modules/.bin/ng build --output-path=dist --prod=true



# Run Stage
FROM nginx:alpine
COPY default.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /usr/share/nginx/html