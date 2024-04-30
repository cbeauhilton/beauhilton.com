FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y wget tar pandoc highlight

# Try running soupault, and download/install it if not found
RUN soupault || (wget https://github.com/PataphysicalSociety/soupault/releases/download/4.10.0/soupault-4.10.0-linux-x86_64.tar.gz \
    && tar -xvf soupault-4.10.0-linux-x86_64.tar.gz \
    && mv -v ./soupault-4.10.0-linux-x86_64/soupault /usr/bin/ \
    soupault)
    
# Expose port 3001
EXPOSE 3001
