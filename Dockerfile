# Download base image
FROM ubuntu:20.04

# Update ubuntu software repository and install Python3, and the pip package
# and the python-venv environmnet
RUN apt-get update && apt install -y python3-dev python3-pip python3.8-venv

# Setting the environment variables in Docker which is 
# same as running source database_env/bin/activate.
ENV PATH = "database_env/bin:${PATH}"

# Create a virtual environmnet for dependencies. This isolates 
# these packages from system-level packages
RUN python3 -m venv database_env

# Copy the applications's requirements.txt and install all required 
# dependencies into the Virtual Environment in Docker.
COPY requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

# Route to this port
EXPOSE 5000

# Move to the app directory
WORKDIR /app

# Let's copy the application source code from our
# local machine to the Docker environment.
COPY . /app

# Run the application
CMD ["python3", "app.py"]
