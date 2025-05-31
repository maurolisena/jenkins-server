#!/bin/bash

# Iniciar SonarQube en background
/opt/sonarqube/bin/run.sh &

# Esperar a que SonarQube esté listo
echo "Esperando a que SonarQube esté UP..."
until curl -s http://localhost:9000/api/system/status | grep -q '"status":"UP"'; do
  sleep 5
done

# Generar token desde admin:admin
echo "Generando token para Jenkins..."
TOKEN_RESPONSE=$(curl -s -u admin:admin -X POST "http://localhost:9000/api/user_tokens/generate" \
  -d "name=jenkins-default-token")

TOKEN=$(echo "$TOKEN_RESPONSE" | grep -oP '(?<="token":")[^"]+')

echo "Token generado: $TOKEN"

# Guardar token en un archivo montado para que Jenkins lo pueda usar
echo "$TOKEN" > /opt/sonarqube/jenkins-token.txt

# Mantener contenedor vivo
tail -f /dev/null