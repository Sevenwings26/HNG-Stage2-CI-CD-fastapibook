FROM python:3.9-slim-buster  # Use a slim base image

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD uvicorn main:app --host="0.0.0.0" --port 8000  # Start Uvicorn
