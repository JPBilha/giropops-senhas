FROM python:3.8

WORKDIR /app

RUN git clone https://github.com/JPBilha/giropops-senhas.git

WORKDIR /app/giropops-senhas

RUN apt-get update \
    && apt-get install -y python3-pip \
    && pip install --no-cache-dir -r requirements.txt \
    && apt-get install -y net-tools \
    && apt-get install -y redis-server  # Instalação do Redis

ENV REDIS_HOST=localhost

EXPOSE 80

COPY start.sh /app/giropops-senhas/start.sh

ENTRYPOINT ["/bin/bash", "/app/giropops-senhas/start.sh"]