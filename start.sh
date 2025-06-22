#!/bin/bash

# Iniciar Node.js en segundo plano para MQTT/WebSockets
node index.js &

# Iniciar Flask con Gunicorn en el puerto de Render
gunicorn --bind 0.0.0.0:$PORT --timeout 600 --workers 4 app:app