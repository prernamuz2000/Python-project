pipeline {
    agent any
    stages {
        stage('Checkout') {
            // Checkout code
        }
        stage('Build') {
            // Build code
        }
        // Other stages (test, deploy, etc.)
    }
    post {
        failure {
            emailext (
                to: 'prerna.muz2000@gmail.com',
                subject: 'Build Failed!',
                body: 'The pipeline at Jenkins has failed. Please check it out. Thanks!'
            )
        }
    }
}
