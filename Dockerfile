# Step 1: Build the React application
FROM node:18-alpine as build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Step 2: Serve the React application
FROM nginx:alpine

COPY --from=build /app/dist /usr/share/nginx/html

# Expose the port nginx is running on
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]


# FROM node:19
# ENV PORT 5173
# EXPOSE 5173

# RUN mkdir -p /usr/src/app
# WORKDIR /usr/src/app
# COPY package.json .
# RUN npm install
# COPY . .

# CMD ["npm", "start"]
