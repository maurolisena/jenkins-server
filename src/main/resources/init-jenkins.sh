#!/bin/sh

echo "Esperando token válido de SonarQube..."

# Esperar hasta que el archivo tenga contenido no vacío y no solo espacios
while true; do
  if [ -s /run/secrets/jenkins-token.txt ]; then
    # Leer contenido y eliminar espacios
    CONTENT=$(cat /run/secrets/jenkins-token.txt | tr -d '[:space:]')
    if [ ! -z "$CONTENT" ]; then
      echo "Token válido encontrado"
      break
    fi
  fi
  sleep 5
done

echo "Token encontrado, arrancando Jenkins..."
exec /usr/local/bin/jenkins.sh