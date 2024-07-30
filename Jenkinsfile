pipeline {
    agent any

    environment {
         echo ${GLOBAL_VAR}
    }
 stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/prernamuz2000/Python-project.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry("${DOCKER_REGISTRY}", "${DOCKER_CREDENTIALS_ID}") {
                        docker.image("${DOCKER_IMAGE}").push("latest")
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh '''
                    docker pull ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:latest
                    docker run -d -p 80:80 ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:latest
                    '''

                }
            }
        }
    }
}
