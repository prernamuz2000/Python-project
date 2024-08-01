pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
            }
        }
    }

    post {
       always {
          mail (
              to: 'prerna.muz2000@gmail.com',
              subject: "Build ${currentBuild.fullDisplayName} completed",
              body: "Build ${currentBuild.fullDisplayName} completed. Check console output at ${env.BUILD_URL}"
          )
      }
  }

}
