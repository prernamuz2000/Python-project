pipeline {
    agent any

    environment {
        MY_VAR = 'my_value'
        AWS_REGION = 'ap-northeast-1' // Update with your AWS region
        ECR_REPO_NAME = 'nginx-repro2' // Update with your ECR repository name
        IMAGE_NAME = 'nginx' // Update with your Docker image name
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                checkout scm
            }
        }
        stage('Login to AWS ECR') {
            steps {
                script {
                    // Configure AWS CLI with your credentials
                    sh '''
                    aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $(aws sts get-caller-identity --query Account --output text).dkr.ecr.$AWS_REGION.amazonaws.com
                    '''
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t $IMAGE_NAME .'
                }
            }
        }
        stage('Tag Docker Image') {
            steps {
                script {
                    // Tag the Docker image for ECR
                    sh '''
                    REPO_URI=$(aws ecr describe-repositories --repository-names $ECR_REPO_NAME --query "repositories[0].repositoryUri" --output text)
                    docker tag $IMAGE_NAME:latest $REPO_URI:latest
                    '''
                }
            }
        }
        stage('Push Docker Image to ECR') {
            steps {
                script {
                    // Push the Docker image to ECR
                    sh '''
                    REPO_URI=$(aws ecr describe-repositories --repository-names $ECR_REPO_NAME --query "repositories[0].repositoryUri" --output text)
                    docker push $REPO_URI:latest
                    '''
                }
            }
        }
    }
}
