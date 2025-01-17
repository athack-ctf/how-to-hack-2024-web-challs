FROM node:18-slim

RUN useradd -m -s /bin/bash hth

WORKDIR /home/hth

COPY package.json .
COPY package-lock.json .
COPY app ./app

RUN npm install --production
RUN chown -R hth:hth /home/hth

USER hth

EXPOSE 2025

CMD ["npm", "start"]
