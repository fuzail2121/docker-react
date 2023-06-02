FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json  .
RUN npm install
COPY . .
RUN npm run build

# second phase starts here, from command separates block.
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

