FROM node:16-alpine

WORKDIR ./app

COPY *.json ./
RUN npm install

COPY . .

RUN npm run build

FROM nginx:latest
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
