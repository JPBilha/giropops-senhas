FROM python:3.8
WORKDIR /app
RUN git clone https://github.com/JPBilha/giropops-senhas.git
WORKDIR /app/giropops-senhas
RUN apt-get update
RUN apt-get install -y python3-pip
RUN pip install --no-cache-dir -r requirements.txt
RUN apt-get install -y redis
RUN systemctl start redis
ENV REDIS_HOST=localhost
EXPOSE 5000
CMD ["flask", "run", "--host=0.0.0.0"]