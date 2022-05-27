FROM node:15.13-alpine
WORKDIR /react
COPY . .
RUN npm ci
RUN npm run build --verbose

