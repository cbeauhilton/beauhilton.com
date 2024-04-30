FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y wget tar pandoc

# Install highlighter
RUN apt-get install -y python3 python3-pip
RUN pip3 install highlighter

# Extract soupault
RUN tar -xvf soupault-4.10.0-linux-x86_64.tar.gz

# Move soupault to /usr/bin
RUN mv -v ./soupault-4.10.0-linux-x86_64/soupault /usr/bin/

# Expose port 3001
EXPOSE 3001

# Run soupault command
CMD ["soupault"]
