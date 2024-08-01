pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                // Your build steps here
                echo 'Building...'
            }
        }
        stage('Test') {
            steps {
                // Your test steps here
                echo 'Testing...'
            }
        }
        stage('Deploy') {
            steps {
                // Your deploy steps here
                echo 'Deploying...'
            }
        }
    }

    post {
        success {
            emailext (
                to: 'prerna.muz2000@gmail.com',
                subject: "SUCCESS: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                body: """
                <p>Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' succeeded.</p>
                <p>Check console output at ${env.BUILD_URL} to view the results.</p>
                """
            )
        }
        failure {
            emailext (
                to: 'prerna.muz2000@gmail.com',
                subject: "FAILURE: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                body: """
                <p>Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' failed.</p>
                <p>Check console output at ${env.BUILD_URL} to view the results.</p>
                """
            )
        }
    }
}
