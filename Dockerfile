# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Install system dependencies if needed
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Copy requirements and install them
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy the repository into the container and install the package in editable mode
# (This will be overridden by the volume mount, but the package is already installed)
COPY . /app
RUN pip install -e .

# Expose any necessary ports for the API (if you decide to use it later)
# EXPOSE 8000

# Start an interactive shell by default
CMD ["bash"]
