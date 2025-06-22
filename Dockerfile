FROM python:3.9-slim

# Instalar Node.js y dependencias del sistema
RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copiar primero los archivos de dependencias para cachear
COPY package.json package-lock.json ./
COPY requirements.txt ./

# Instalar dependencias
RUN npm install && pip install --no-cache-dir -r requirements.txt gunicorn

# Copiar el resto de la aplicación
COPY . .

# Puerto que Render requiere (10000 es el estándar)
EXPOSE 10000

CMD ["./start.sh"]