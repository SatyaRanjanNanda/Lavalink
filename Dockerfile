# Use the official Node.js Alpine base for ultra-low resource footprint
FROM node:22-alpine

# Set application context directory
WORKDIR /app

# Pull build tools and clone the core engine repository
RUN apk add --no-cache git python3 make g++ \
    && git clone https://github.com/PerformanC/NodeLink.git . \
    && npm install --omit=dev --ignore-scripts

# Inform routing about Render's target port
EXPOSE 7860

# Assign system container defaults
ENV NODELINK_PORT=7860
ENV NODELINK_PASSWORD=YOUR_SECURE_PASSWORD

# Fire up the runtime engine execution loop
CMD ["node", "src/index.js"]
