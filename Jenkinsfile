pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                // Your build steps
            }
        }
        stage('Test') {
            steps {
                // Your test steps
            }
        }
    }

    post {
        success {
            emailext (
                subject: "Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})",
                body: "The Pipeline '${env.JOB_NAME}' (${env.BUILD_URL}) completed successfully.",
                recipientProviders: [[$class: 'DevelopersRecipientProvider']]
            )
        }
        failure {
            emailext (
                subject: "Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})",
                body: "The Pipeline '${env.JOB_NAME}' (${env.BUILD_URL}) failed.",
                recipientProviders: [[$class: 'DevelopersRecipientProvider']]
            )
        }
    }
}
