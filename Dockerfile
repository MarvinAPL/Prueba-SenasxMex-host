# Imagen base con Python y Node.js
FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    libgl1-mesa-glx \
    libglib2.0-0 \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# 5. Copiar aplicación
COPY . .

# 3. Copiar e instalar dependencias Python
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# 4. Copiar e instalar dependencias Node
RUN npm install

# 5. Copiar aplicación
COPY . .

# 6. Variables de entorno
ENV FLASK_APP=app.py
ENV FLASK_ENV=production

# 7. Exponer puertos (sin comentarios en línea)
EXPOSE 5000
EXPOSE 3000

# 8. Comando de inicio
CMD ["./start.sh"]
