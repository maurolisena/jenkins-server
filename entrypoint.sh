#!/bin/bash
set -e

echo "Descargando configuración JCasC desde config-server..."
mkdir -p /var/jenkins_home/casc_configs
curl -s -o /var/jenkins_home/casc_configs/main.yaml http://config-server:8888/jenkins-server/dev

echo "Iniciando Jenkins..."
exec /sbin/tini -- /usr/local/bin/jenkins.sh