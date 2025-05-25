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