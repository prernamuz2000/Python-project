pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                // Add your build steps here
                sh 'echo "Building..."'
            }
        }
        stage('Test') {
            steps {
                // Add your test steps here
                sh 'echo "Testing..."'
            }
        }
    }

    post {
        success {
            emailext (
                subject: "Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL}) - Success",
                body: """
                <p>Build and Test Stages completed successfully.</p>
                <p>Job: ${env.JOB_NAME} [${env.BUILD_NUMBER}]</p>
                <p>URL: <a href="${env.BUILD_URL}">${env.BUILD_URL}</a></p>
                """,
                mimeType: 'text/html',
                to: 'prerna.muz2000@gmail.com'
            )
        }
        failure {
            emailext (
                subject: "Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL}) - Failed",
                body: """
                <p>Build and/or Test Stages failed.</p>
                <p>Job: ${env.JOB_NAME} [${env.BUILD_NUMBER}]</p>
                <p>URL: <a href="${env.BUILD_URL}">${env.BUILD_URL}</a></p>
                """,
                mimeType: 'text/html',
                to: 'prerna.muz2000@gmail.com'
            )
        }
    }
}
