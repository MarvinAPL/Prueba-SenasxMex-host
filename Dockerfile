# Imagen base con Python y Node.js
FROM python:3.10-slim

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    build-essential \
    libgl1-mesa-glx \
    libglib2.0-0 \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Crear carpeta de trabajo
WORKDIR /app

# Copiar dependencias y archivos
COPY requirements.txt ./
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copiar el resto del código
COPY . .

# Dar permisos al script
RUN chmod +x start.sh

# Exponer el puerto que usará gunicorn
EXPOSE 5000

# Comando de inicio
CMD ["./start.sh"]
