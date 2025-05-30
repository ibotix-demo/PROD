# Use an official lightweight Python image.
FROM python:3.10-slim

# Set the working directory in the Docker container.
WORKDIR /app

# Upgrade pip
RUN pip install --upgrade pip

# Install Python dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the local application to the container
COPY . .

# The application's port number
EXPOSE 8000

# Command to run the application using Uvicorn
CMD ["uvicorn", "app.main:app","--host", "0.0.0.0", "--port", "8000"]
