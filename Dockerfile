# Builder Stage
FROM node:lts-alpine as builder

WORKDIR '/app'
COPY package.json .

RUN npm install
COPY . .
RUN npm run build


# Run Stage
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/ngnix/html

