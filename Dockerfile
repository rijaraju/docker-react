FROM node:alpine 

#set working dir inside container
WORKDIR '/app' 

#copy package.json file into the container
COPY package*.json ./
RUN npm install

# Run all other files and build container
COPY ./ ./
RUN npm run build

FROM nginx
# Expose port 8080 inside container
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html