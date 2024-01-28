FROM python:3.11-alpine

WORKDIR /app
COPY . .

# Install dependencies
RUN apk add --no-cache bash build-base libffi-dev openssl-dev

RUN pip install --no-cache-dir -r requirements.txt
RUN chmod +x ./scripts/*.sh

EXPOSE 3000
ENTRYPOINT ["/bin/sh", "./scripts/run.sh"]
