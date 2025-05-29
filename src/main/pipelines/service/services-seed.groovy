pipelineJob('product-service') {
    definition {
        cpsScm {
            scm {
                git {
                    remote { url('https://github.com/maurolisena/jenkins-server.git') }
                    branch('main')
                }
            }
            scriptPath('src/main/pipelines/service/product-service/Jenkinsfile')
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
            scriptPath('src/main/pipelines/service/inventory-service/Jenkinsfile')
        }
    }
}