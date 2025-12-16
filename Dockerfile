FROM python:3.12-slim

# Read required argument
ARG TELEGRAM_BOT_APIKEY
RUN test -n "$TELEGRAM_BOT_APIKEY"
ENV TELEGRAM_BOT_APIKEY $TELEGRAM_BOT_APIKEY

# Setup and install
WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY ./app .

# Don't run as root
RUN useradd appuser && chown -R appuser /app
USER appuser

# Run
CMD ["fastapi", "run", "main.py", "--port", "80"]
