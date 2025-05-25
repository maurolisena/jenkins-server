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
    groupadd docker && \
    usermod -aG docker jenkins

# Instalar curl para descargar configs
USER root
RUN apt-get update && apt-get install -y curl && apt-get clean
USER jenkins

# Copiamos el entrypoint custom
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Definimos entrypoint custom
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]