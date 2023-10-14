# Use an official Python image as a parent image
FROM python:3.8-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory inside the container
WORKDIR /app

# Copy only the requirements file into the container
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code into the container
COPY . .

# Collect static files if applicable (for Django, Flask, etc.)
# RUN python manage.py collectstatic --noinput

# Expose the necessary port (if your app listens on a specific port)
EXPOSE 8000

# Define the command to run your application
CMD [ "python", "app.py" ]
