#!/bin/bash

# Levantar el frontend (en segundo plano)
cd frontend
npm install
npm run build &
cd ..

# Ejecutar Flask con Gunicorn
exec gunicorn -b 0.0.0.0:5000 app:app
