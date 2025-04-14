FROM node:18

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run build

# 用 nginx 作为前端容器（可选）
FROM nginx:alpine
COPY --from=0 /app/dist /usr/share/nginx/html
