#!/bin/bash

# Instalar dependencias del frontend (si no se hizo en Dockerfile)
cd frontend
npm install
npm start &  # O npm start &  si es dev

# Volver a raíz del proyecto
cd ..

# Correr Flask con gunicorn
exec gunicorn -b 0.0.0.0:5000 app:app
