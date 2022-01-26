FROM node:8
WORKDIR /usr/src/app
COPY customer-list-app-frontend/ ./customer-list-app-frontend/
COPY customer-list-app-backend/ ./customer-list-app-backend/

RUN cd customer-list-app-frontend && npm install && npm run serve
RUN cd customer-list-app-backend && npm install && sudo mongod 
RUN cd customer-list-app-backend && npm run start

COPY customer-list-app-frontend/package*.json ./customer-list-app-frontend/
COPY customer-list-app-backend/package*.json ./customer-list-app-backend/
COPY . .

EXPOSE 8080
CMD [ "npm", "run","start:dev" ]
