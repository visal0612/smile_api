# Use an official Python runtime as a parent image
FROM python:latest

# Set the working directory in the container
WORKDIR /smile_app

# Copy the current directory contents into the container
COPY . /smile_app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variable
ENV FLASK_APP smile_app.py

# Run app.py when the container launches
CMD ["flask", "run", "--host=0.0.0.0"]