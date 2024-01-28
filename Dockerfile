FROM python:3.11-alpine

WORKDIR /app
COPY . .

# Change Alpine source to Aliyun
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

# Install dependencies
RUN apk add --no-cache bash build-base libffi-dev openssl-dev

RUN pip install --no-cache-dir -r requirements.txt
RUN chmod +x ./scripts/*.sh

EXPOSE 3000
CMD ["/bin/sh", "./scripts/run.sh"]

