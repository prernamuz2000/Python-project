pipeline {
    agent any

    environment {
         ECR_REPO_URL = ''
    }
    stages {
        stage('Set ECR URL') {
            steps {
                script {
                    // Construct the ECR URL dynamically
                    def accountId = '701251269124'  // Replace with your AWS account ID
                    def region = 'ap-northeast-1'  // Replace with your AWS region
                    def repoName = 'nginx-repro2'  // Replace with your repository name

                    // Set the ECR URL
                    env.ECR_REPO_URL = "${accountId}.dkr.ecr.${region}.amazonaws.com/${repoName}"
                }
            }
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
