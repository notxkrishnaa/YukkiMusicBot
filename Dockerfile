FROM nikolaik/python-nodejs:python3.9-nodejs18

# 1. First install system dependencies including Git
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    git \
    ffmpeg \
    gcc \
    python3-dev \
    build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 2. Copy application files
COPY . /app/
WORKDIR /app/

# 3. Install Python requirements
RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir -r requirements.txt

# 4. Start command
CMD ["bash", "start"]