pipelineJob('config-server') {
    definition {
        cpsScm {
            scm {
                git {
                    remote { url('https://github.com/maurolisena/jenkins-server.git') }
                    branch('main')
                }
            }
            scriptPath('src/main/pipelines/config-server/Jenkinsfile')
        }
    }
}

pipelineJob('keycloack-server') {
    definition {
        cpsScm {
            scm {
                git {
                    remote { url('https://github.com/maurolisena/jenkins-server.git') }
                    branch('main')
                }
            }
            scriptPath('src/main/pipelines/keycloack-server/Jenkinsfile')
        }
    }
}

pipelineJob('gateway-server') {
    definition {
        cpsScm {
            scm {
                git {
                    remote { url('https://github.com/maurolisena/jenkins-server.git') }
                    branch('master')
                }
            }
            scriptPath('src/main/pipelines/api-gateway/Jenkinsfile')
        }
    }
}