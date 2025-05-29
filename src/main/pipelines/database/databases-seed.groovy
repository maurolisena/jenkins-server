pipelineJob('mysql-db') {
    definition {
        cpsScm {
            scm {
                git {
                    remote { url('https://github.com/maurolisena/jenkins-server.git') }
                    branch('main')
                }
            }
            scriptPath('src/main/pipelines/database/mysql/Jenkinsfile')
        }
    }
}

pipelineJob('postgresql-db') {
    definition {
        cpsScm {
            scm {
                git {
                    remote { url('https://github.com/maurolisena/jenkins-server.git') }
                    branch('main')
                }
            }
            scriptPath('src/main/pipelines/database/postgresql/Jenkinsfile')
        }
    }
}

pipelineJob('mongo-db') {
    definition {
        cpsScm {
            scm {
                git {
                    remote { url('https://github.com/maurolisena/jenkins-server.git') }
                    branch('main')
                }
            }
            scriptPath('src/main/pipelines/database/mongo/Jenkinsfile')
        }
    }
}

pipelineJob('redis-db') {
    definition {
        cpsScm {
            scm {
                git {
                    remote { url('https://github.com/maurolisena/jenkins-server.git') }
                    branch('main')
                }
            }
            scriptPath('src/main/pipelines/database/redis/Jenkinsfile')
        }
    }
}

