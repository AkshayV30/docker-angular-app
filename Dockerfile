FROM node:18-alpine3.16  as builder

WORKDIR '/usr/app'

COPY package.json .
RUN npm install

COPY . .
RUN npm run build --prod

FROM nginx:alpine
COPY --from=builder /usr/app/dist/docker-angular-app /usr/share/nginx/html
