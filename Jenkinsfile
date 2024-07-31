pipeline {
    agent any

    environment {
        GLOBAL_VAR = 'my-globalvariable'
        IMAGE_NAME = 'nginx'
        AWS_REGION = 'ap-northeast-1'
        AWS_ACCOUNT_ID = 701251269124
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub
                checkout "https://github.com/prernamuz2000/Python-project.git"
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh 'aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 701251269124.dkr.ecr.ap-northeast-1.amazonaws.com'
                    
                    // Build your Docker image
                    sh 'docker build -t 701251269124.dkr.ecr.ap-northeast-1.amazonaws.com/my-nginx:latest .'
                    
                    // Push the Docker image to ECR
                    sh 'docker push 701251269124.dkr.ecr.ap-northeast-1.amazonaws.com/my-nginx:latest'
                }
            }
        }

        stage('Login to ECR') {
            steps {
                script {
                    // Login to AWS ECR
                    sh """
                        aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 701251269124.dkr.ecr.ap-northeast-1.amazonaws.com/my-nginx
                    """
                }
            }
        }

        stage('Tag and Push Docker Image') {
            steps {
                script {
                    // Tag the Docker image
                    sh "docker tag ${IMAGE_NAME}:latest ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO}:latest"
                    
                    // Push the Docker image
                    sh "docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO}:latest"
                }
            }
        }
    }
}
