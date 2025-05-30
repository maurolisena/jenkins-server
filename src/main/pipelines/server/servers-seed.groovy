pipelineJob('config-server') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url('https://github.com/maurolisena/jenkins-server.git')
                        credentials('GitHub')
                    }
                    branch('main')
                }
            }
            scriptPath('src/main/pipelines/server/config-server/Jenkinsfile')
        }
    }
}

pipelineJob('keycloack-server') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url('https://github.com/maurolisena/jenkins-server.git')
                        credentials('GitHub')
                    }
                    branch('main')
                }
            }
            scriptPath('src/main/pipelines/server/keycloack-server/Jenkinsfile')
        }
    }
}

pipelineJob('gateway-server') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url('https://github.com/maurolisena/jenkins-server.git')
                        credentials('GitHub')
                    }
                    branch('main')
                }
            }
            scriptPath('src/main/pipelines/server/api-gateway/Jenkinsfile')
        }
    }
}

pipelineJob('kafka-server') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url('https://github.com/maurolisena/jenkins-server.git')
                        credentials('GitHub')
                    }
                    branch('main')
                }
            }
            scriptPath('src/main/pipelines/server/kafka-server/Jenkinsfile')
        }
    }
}

pipelineJob('eureka-server') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url('https://github.com/maurolisena/jenkins-server.git')
                        credentials('GitHub')
                    }
                    branch('main')
                }
            }
            scriptPath('src/main/pipelines/server/eureka-server/Jenkinsfile')
        }
    }
}