FROM node:12.4.0-stretch
RUN npm i -g --unsafe-perm prisma2
WORKDIR /tmp
COPY package.json .
RUN yarn
COPY . .
RUN prisma2 generate \
    && prisma2 lift save \
    && prisma2 lift up
EXPOSE 3000 4000
CMD ["npm","run","start"]
