#!/bin/bash

# Function to install and manage the HTTP server (Apache)
install_and_manage_httpd() {
  # Check if Apache is installed
  if ! command -v httpd &> /dev/null; then
    echo "Apache HTTP Server not found. Installing..."
    sudo yum update -y
    sudo yum install -y httpd
  else
    echo "Apache HTTP Server is already installed."
  fi

  # Check if action is 'start' or 'stop' and take action
  if [ "$1" == "start" ]; then
    echo "Starting Apache HTTP Server..."
    sudo systemctl start httpd
    sudo systemctl enable httpd  # Ensure it starts on reboot
  elif [ "$1" == "stop" ]; then
    echo "Stopping Apache HTTP Server..."
    sudo systemctl stop httpd
  else
    echo "Invalid action. Please use 'start' or 'stop'."
    exit 1
  fi
}

# Call the function with the first argument ('start' or 'stop')
install_and_manage_httpd $1
