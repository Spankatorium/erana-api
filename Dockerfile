### BUILDER ###
FROM node:20-alpine AS builder
WORKDIR /app

# Copy package files to builder
COPY package*.json ./

# Clean install everything
RUN npm ci

# Copy TSC files
COPY tsconfig.json ./
COPY src ./src

# Call the NPM 'build' task
RUN npm run build

# Purge dev dependencies
RUN npm ci --omit=dev



### TARGET ###
FROM node:20-alpine
WORKDIR /app

# Trust the builder and copy all
COPY --from=builder /app .

# Express port
EXPOSE 3000

CMD ["npm", "start"]