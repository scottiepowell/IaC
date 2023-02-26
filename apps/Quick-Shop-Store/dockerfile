# Use an official Python runtime as a parent image
FROM python:3.9-slim-buster

# Set the working directory to /app
WORKDIR /app

# Copy the requirements file to the container and install the required packages
COPY requirements.txt ./
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Copy the rest of the app code to the container
COPY . .

# Make the static and templates folders available to the app
COPY static /app/static
COPY templates /app/templates

# Make port 4000 available to the world outside this container
EXPOSE 4000

# Set the default environment variables
ENV FLASK_APP=app.py
ENV FLASK_ENV=production

# Run the app
CMD ["flask", "run", "--host", "0.0.0.0", "--port", "4000"]
