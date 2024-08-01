pipeline {
    agent {
        label 'agent-via-ssh'
    }
    environment {
        compose_service_name = "react-jenkins-docker"
    }
    stages {
        stage('Checkout Source') {
            steps {
                ws("${workspace}") {
                    checkout scm
                }
            }
        }
        stage('Docker Comopse Build') {
            steps {
                ws("${workspace}"){
                    sh "docker compose build --no-cache ${compose_service_name}"
                }
            }
        }
        stage('Docker Comopse Up') {
            steps {
                ws("${workspace}"){
                    sh "docker compose up --no-deps -d ${compose_service_name}"
                }
            }
        }
    }
    post {
        success {
            emailext body: "Build ${currentBuild.fullDisplayName} succeeded",
                        subject: "${env.JOB_NAME} - Build #${env.BUILD_NUMBER} - Successful",
                        to: 'prerna.muz2000@gmail.com',
                        attachLog: true
        }
        failure {
            emailext body: "Build ${currentBuild.fullDisplayName} failed",
                        subject: "${env.JOB_NAME} - Build #${env.BUILD_NUMBER} - Failed",
                        to: 'prerna.muz2000@gmail.com',
                        attachLog: true
        }
    }
}
