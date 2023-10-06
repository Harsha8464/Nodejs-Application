# Stage 1: Build the Node.js Application
FROM node:14 as builder

WORKDIR /app

COPY package*.json ./

RUN npm install express

COPY . .

# Stage 2: Create a Minimal Runtime Image
FROM node:14-alpine

WORKDIR /app

COPY --from=builder /app .

EXPOSE 3000

CMD [ "npm", "start" ]

