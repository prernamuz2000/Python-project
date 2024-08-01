pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                // Add your build steps here
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                // Add your test steps here
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                // Add your deploy steps here
            }
        }
    }

    post {
        always {
            emailext (
                subject: "Job '${env.JOB_NAME}' (${env.BUILD_NUMBER}) - ${currentBuild.currentResult}",
                body: """<p>Job '${env.JOB_NAME}' (${env.BUILD_NUMBER}) - ${currentBuild.currentResult}</p>
                         <p>Check console output at <a href="${env.BUILD_URL}">${env.BUILD_URL}</a></p>""",
                recipientProviders: [[$class: 'DevelopersRecipientProvider']],
                to: 'prerna.muz2000@gmail.com'
            )
        }
        success {
            echo 'Build was successful!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}
