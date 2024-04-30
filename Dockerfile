FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y wget tar pandoc

# Install pipx and highlighter
RUN apt-get install -y python3-full python3-pip python3-venv
RUN python3 -m pip install --user pipx
RUN python3 -m pipx ensurepath
RUN pipx install highlighter

# Extract soupault
RUN tar -xvf soupault-4.10.0-linux-x86_64.tar.gz

# Move soupault to /usr/bin
RUN mv -v ./soupault-4.10.0-linux-x86_64/soupault /usr/bin/

# Expose port 3001
EXPOSE 3001

# Run soupault command
CMD ["soupault"]
