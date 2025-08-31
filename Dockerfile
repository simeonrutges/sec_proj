# Basis image met Python
FROM python:3.12-slim

# Installeer git (handig voor CI/CD en debugging)
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
 && rm -rf /var/lib/apt/lists/*

# Werkdirectory in de container
WORKDIR /app

# Dependencies installeren
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Kopieer projectbestanden
COPY . .

# Default command
CMD ["robot", "tests"]
