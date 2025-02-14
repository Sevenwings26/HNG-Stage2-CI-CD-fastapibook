# Use Python official image
FROM python:3.10

# Set working directory
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Install Nginx
RUN apt update && apt install -y nginx

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/sites-available/default
RUN ln -sf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

# Expose necessary ports
EXPOSE 80 8000

# Start FastAPI and Nginx together
CMD service nginx start && uvicorn main:app --host 0.0.0.0 --port 8000
