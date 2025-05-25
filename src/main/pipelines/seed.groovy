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
                    branch('main')
                }
            }
            scriptPath('src/main/pipelines/api-gateway/Jenkinsfile')
        }
    }
}

pipelineJob('kafka-server') {
    definition {
        cpsScm {
            scm {
                git {
                    remote { url('https://github.com/maurolisena/jenkins-server.git') }
                    branch('main')
                }
            }
            scriptPath('src/main/pipelines/kafka-server/Jenkinsfile')
        }
    }
}

pipelineJob('eureka-server') {
    definition {
        cpsScm {
            scm {
                git {
                    remote { url('https://github.com/maurolisena/jenkins-server.git') }
                    branch('main')
                }
            }
            scriptPath('src/main/pipelines/eureka-server/Jenkinsfile')
        }
    }
}

pipelineJob('product-service') {
    definition {
        cpsScm {
            scm {
                git {
                    remote { url('https://github.com/maurolisena/jenkins-server.git') }
                    branch('main')
                }
            }
            scriptPath('src/main/pipelines/product-service/Jenkinsfile')
        }
    }
}

pipelineJob('inventory-service') {
    definition {
        cpsScm {
            scm {
                git {
                    remote { url('https://github.com/maurolisena/jenkins-server.git') }
                    branch('main')
                }
            }
            scriptPath('src/main/pipelines/inventory-service/Jenkinsfile')
        }
    }
}