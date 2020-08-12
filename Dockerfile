FROM node:alpine as builder
WORDKIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run builder

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html