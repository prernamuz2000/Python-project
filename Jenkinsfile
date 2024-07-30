pipeline {
    agent any

    environment {
        GLOBAL_VAR = 'my-globalvariable'
        ECR_REPO = 'nginx-repro2'
        IMAGE_NAME = 'nginx'
        AWS_REGION = 'ap-northeast-1'
    }

    stages {
        stage('Build') {
            steps {
                script {
                    echo " ${GLOBAL_VAR}"
                }
            }
        }
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
                    sh "docker build -t ${IMAGE_NAME}:latest ."
                }
            }
        }

        stage('Login to ECR') {
            steps {
                script {
                    // Login to AWS ECR
                    sh """
                        $(aws ecr get-login-password --region $ap-northeast-1 | docker login --username AWS --password-stdin $GLOBAL_VAR.dkr.ecr.ap-northeast-1.amazonaws.com)
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
