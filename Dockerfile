FROM jenkins/jenkins:lts

USER root

# Instalar dependencias
RUN apt-get update && apt-get install -y \
    wget unzip curl git openjdk-17-jdk maven \
    && rm -rf /var/lib/apt/lists/*

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

# Instalar SonarScanner
ENV SONAR_SCANNER_VERSION=5.0.1.3006
RUN wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip && \
    unzip sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip -d /opt && \
    mv /opt/sonar-scanner-${SONAR_SCANNER_VERSION} /opt/sonar-scanner && \
    ln -s /opt/sonar-scanner/bin/sonar-scanner /usr/local/bin/sonar-scanner && \
    rm sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip

ENV SONAR_SCANNER_HOME=/opt/sonar-scanner
ENV PATH="$SONAR_SCANNER_HOME/bin:$PATH"

# Configurar Jenkins para usar Java y Maven automáticamente
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

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
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"