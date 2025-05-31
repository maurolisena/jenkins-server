#!/bin/sh

echo "Esperando a que SonarQube esté UP..."
until curl -s http://sonarqube:9000/api/system/status | grep -q '"status":"UP"'; do
  sleep 5
done

echo "Generando token para Jenkins..."
TOKEN_RESPONSE=$(curl -s -u admin:admin -X POST "http://sonarqube:9000/api/user_tokens/generate" \
  -d "name=jenkins-default-token")

TOKEN=$(echo "$TOKEN_RESPONSE" | grep -o '"token":"[^"]*"' | cut -d':' -f2 | tr -d '"')

echo "Token generado: $TOKEN"
echo "$TOKEN" > /token_shared/jenkins-token.txt

echo "✅ Token guardado en /token_shared/jenkins-token.txt"