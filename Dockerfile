FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN [ "npm", "run", "build" ]
# Start nginx base image
FROM nginx
# Copy app folder from previous build again
COPY --from=builder /app/build /usr/share/nginx/html