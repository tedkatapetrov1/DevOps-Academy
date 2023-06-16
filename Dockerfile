FROM node:latest

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx

COPY --from=0 /app/dist/apps/website/browser /usr/share/nginx/html
