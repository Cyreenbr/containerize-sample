# syntax=docker/dockerfile:1

# --- build stage ---
FROM node:18 AS build
WORKDIR /usr/src/app

COPY app/package*.json ./
RUN npm ci --silent

COPY app/ .
RUN npm run lint || true

# --- production stage ---
FROM node:18-alpine AS runtime
WORKDIR /usr/src/app

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

COPY --from=build /usr/src/app /usr/src/app
RUN chown -R appuser:appgroup /usr/src/app
USER appuser

ENV NODE_ENV=production
EXPOSE 3000
CMD ["node", "server.js"]