FROM nikolaik/python-nodejs:python3.9-nodejs18

# Install system dependencies
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    ffmpeg \
    git \
    gcc \
    python3-dev \
    build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy application files
COPY . /app/
WORKDIR /app/

# Install Python requirements
RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir --requirement requirements.txt

# Start command
CMD ["bash", "start"]