FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json package-lock.json* ./

# Install all dependencies (including dev for nodemon)
RUN npm install

# Copy application files
COPY . .

# Expose port
EXPOSE 3000

# Health check

CMD ["npm", "start"]
