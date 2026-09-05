# Step 1: Build Environment
FROM node:22-alpine AS builder

WORKDIR /app

# Install native compilation dependencies
RUN apk add --no-cache git python3 make g++

# Clone the official NodeLink repository with the complete path
RUN git clone https://github.com .

# Install ALL packages (including devDependencies required for compilation)
RUN npm install --ignore-scripts

# Build/Compile the production distribution assets
RUN npm run build

# Remove development packages to minimize memory footprint
RUN npm prune --omit=dev


# Step 2: Production Execution Runtime
FROM node:22-alpine

WORKDIR /app

# Copy over only the compiled source code and production dependencies
COPY --from=builder /app /app

# Expose Render's assigned network channel
EXPOSE 7860

# Assign runtime default options
ENV NODELINK_PORT=7860
ENV NODELINK_PASSWORD=YOUR_SECURE_PASSWORD

# Start the optimized server engine smoothly
CMD ["node", "dist/index.js"]
