# first phase that build the node application
FROM node:alpine as builder

WORKDIR /app

COPY package.json .
RUN npm i

COPY . .

RUN npm run build

# second phase that starts nginx and import the previous build
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html