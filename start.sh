#!/bin/bash

# Iniciar backend Flask (en segundo plano)
exec gunicorn -b 127.0.0.1:5000 app:app &

# Iniciar frontend (en primer plano para que Render lo detecte)
cd frontend
npm install
exec npm start
