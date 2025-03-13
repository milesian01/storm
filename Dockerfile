# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Install system dependencies if needed
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Copy the STORM repository into the container
WORKDIR /app
COPY . /app

# Create and activate a virtual environment (optional)
# RUN python -m venv venv
# ENV PATH="/app/venv/bin:$PATH"

# Install requirements
RUN pip install --upgrade pip && pip install -r requirements.txt

# Expose any necessary ports for the API (if you decide to use it later)
# EXPOSE 8000

# Start an interactive shell by default
CMD ["bash"]
