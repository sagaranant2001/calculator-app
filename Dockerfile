# FROM python:3.12-slim - base image uploaded on docker hub
# WORKDIR/app - 
# COPY requirements.txt
# RUN pip install --no-cache-dir -r requirements.txt
# COPY main.py - 
# EXPOSE 8000 - port number 
# CMD ["uvicorn", "main:app", "--host",  "0.0.0.0", "--port", "8000"]

# Start from an official Python image
FROM python:3.12-slim

# Work inside /app in the container
WORKDIR /app

# Copy the dependency list first, then install it
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the app code
COPY main.py .

# Document the port the app listens on
EXPOSE 8000

# Command that starts the app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]