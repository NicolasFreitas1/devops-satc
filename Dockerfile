# Multi-stage Dockerfile for building and serving a React app (Vite)

# Build stage
FROM node:18-bullseye-slim AS build
WORKDIR /app

# Copy package files first to leverage Docker layer cache
COPY package*.json ./
# Sem scripts de lifecycle no projeto; --ignore-scripts evita execução arbitrária em install (Sonar S6505)
RUN npm ci --silent --ignore-scripts

# Apenas ficheiros necessários ao build (evita copiar o repositório inteiro)
COPY index.html vite.config.js ./
COPY src ./src/
RUN npm run build

# Production stage: Nginx como utilizador não privilegiado
FROM nginx:stable-alpine
COPY --from=build /app/dist /usr/share/nginx/html

# Porta 8080: utilizadores sem privilégios não podem fazer bind à 80
RUN echo 'server { \
    listen 8080; \
    root /usr/share/nginx/html; \
    index index.html; \
    location / { try_files $uri $uri/ /index.html; } \
}' > /etc/nginx/conf.d/default.conf \
    && chown -R nginx:nginx /usr/share/nginx/html /var/cache/nginx /var/log/nginx \
    && chmod -R g+w /var/cache/nginx \
    && sed -i 's|/run/nginx.pid|/tmp/nginx.pid|g' /etc/nginx/nginx.conf \
    && sed -i 's|/var/run/nginx.pid|/tmp/nginx.pid|g' /etc/nginx/nginx.conf

USER nginx

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
