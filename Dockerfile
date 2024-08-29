FROM node:latest as builder

WORKDIR /app

ENV NODE_ENV=production

COPY package*.json /app/

USER 0
RUN npm ci --production

USER node
COPY . /app/

FROM node:slim

WORKDIR /app

COPY --from=builder /app /app

EXPOSE 3000

CMD ["npm", "start"]
