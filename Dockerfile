# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Install system dependencies (like git) if needed
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements and install them
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy the entire repository into the container
COPY . /app

# Install the package in editable mode using the absolute path
RUN pip install -e /app

# Default command is to open a bash shell
CMD ["bash"]
