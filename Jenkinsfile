pipeline {
    agent any

    environment {
        EMAIL_RECIPIENT = 'prerna.muz2000@gmail.com'
    }

    stages {
        stage('Build') {
            steps {
                // Your build steps go here
                script {
                    try {
                        echo 'Building...'
                        // Simulate build step
                        sh 'exit 1' // Simulating failure
                    } catch (Exception e) {
                        currentBuild.result = 'ALERT'
                        throw e
                    }
                }
            }
        }
    }

    post {
        failure {
            emailext(
                subject: "Pipeline ${env.JOB_NAME} - Build # ${env.BUILD_NUMBER} - ${currentBuild.result}",
                body: "Build failed. Please check Jenkins for details.\n\nBuild URL: ${env.BUILD_URL}",
                to: "${EMAIL_RECIPIENT}"
            )
        }
        success {
            echo 'Pipeline succeeded!'
        }
    }
}
