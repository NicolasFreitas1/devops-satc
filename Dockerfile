# Multi-stage Dockerfile for building and serving a React app (Vite)

# Build stage
FROM node:18-bullseye-slim AS build
WORKDIR /app

# Copy package files first to leverage Docker layer cache
COPY package*.json ./
RUN npm ci --silent

# Apenas ficheiros necessários ao build (evita copiar o repositório inteiro)
COPY index.html vite.config.js ./
COPY src ./src/
RUN npm run build

# Production stage
FROM nginx:stable-alpine
COPY --from=build /app/dist /usr/share/nginx/html

# SPA: fallback to index.html for client-side routing
RUN echo 'server { \
    listen 80; \
    root /usr/share/nginx/html; \
    index index.html; \
    location / { try_files $uri $uri/ /index.html; } \
}' > /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
