# Base image olarak Python 3.9'u kullan
FROM python:3.10-slim

# Çalışma dizinini oluştur
WORKDIR /app

# Gereken paketleri yükle
COPY requirements.txt .
RUN pip install -r requirements.txt

# Scriptleri kopyala
COPY . .

# Git yapılandırması
RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# generate_project.py scriptini çalıştır
CMD ["python", "generate_project_new.py"]
