pipeline {
    agent any
    parameters {
        string(
            name: 'email', 
            defaultValue: 'prerna.muz2000@gmail.com', 
            description: 'Email address to send notification' )
    }
    stages{
          stage("Test-Stage")
                { 
                  steps {
                    echo "This is the test stage for Testing Jenkins Job notification"
                    exit 1
                    }
                  }
          }

    post {
            failure {
                emailext(
                    subject: "${JOB_NAME}.${BUILD_NUMBER} FAILED",
                    mimeType: 'text/html',
                    to: "prerna.muz2000@gmail.com",
                    body: "${JOB_NAME}.${BUILD_NUMBER} FAILED"
                )
            }
            success {
                emailext(
                    subject: "${JOB_NAME}.${BUILD_NUMBER} PASSED",
                    mimeType: 'text/html',
                    to: "prerna.muz2000@gmail.com",
                    body: "${JOB_NAME}.${BUILD_NUMBER} PASSED"
                )
            }
    }
}
