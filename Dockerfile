FROM jenkins/jenkins:lts

USER root

# Instalar Maven
RUN apt-get update && apt-get install -y maven

# Instalar dependencias y Docker CLI + Docker Compose plugin
RUN apt-get update && \
    apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        lsb-release \
        sudo && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | \
        gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
        https://download.docker.com/linux/debian $(lsb_release -cs) stable" | \
        tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install -y docker-ce-cli docker-compose-plugin && \
    groupadd -f docker && \
    usermod -aG docker jenkins && \
    apt-get clean

#Instalar plugins de Jenkins
COPY src/main/resources/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

# Crear carpeta para configuración JCasC
RUN mkdir -p /var/jenkins_home/casc_configs && \
    chown -R jenkins:jenkins /var/jenkins_home/casc_configs

# Copiar el archivo YAML de configuración
COPY src/main/resources/jenkins-server.yaml /var/jenkins_home/casc_configs/main.yaml

# Cambiar de nuevo al usuario Jenkins
USER jenkins

# Setear ruta JCasC
ENV CASC_JENKINS_CONFIG=/var/jenkins_home/casc_configs/main.yaml