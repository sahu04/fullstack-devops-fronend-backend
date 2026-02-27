pipeline {
    agent any

    environment {
        AWS_REGION = "us-west-1"
        ACCOUNT_ID = "605518582307"

        BACKEND_REPO  = "${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/backend"
        FRONTEND_REPO = "${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/frontend"

        IMAGE_TAG = "${env.BUILD_NUMBER}"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/your-org/your-repo.git'
            }
        }

        stage('Login to ECR') {
            steps {
                sh """
                aws ecr get-login-password --region ${AWS_REGION} | \
                docker login --username AWS --password-stdin ${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com
                """
            }
        }

        stage('Build & Push Images') {
            parallel {

                stage('Backend') {
                    steps {
                        sh """
                        docker build -t backend:${IMAGE_TAG} ./backend
                        docker tag backend:${IMAGE_TAG} ${BACKEND_REPO}:${IMAGE_TAG}
                        docker push ${BACKEND_REPO}:${IMAGE_TAG}
                        """
                    }
                }

                stage('Frontend') {
                    steps {
                        sh """
                        docker build -t frontend:${IMAGE_TAG} ./frontend
                        docker tag frontend:${IMAGE_TAG} ${FRONTEND_REPO}:${IMAGE_TAG}
                        docker push ${FRONTEND_REPO}:${IMAGE_TAG}
                        """
                    }
                }
            }
        }

        stage('Deploy to EKS') {
            steps {
                sh """
                aws eks update-kubeconfig \
                --region ${AWS_REGION} \
                --name fullstack-cluster
                """

                # Apply all app manifests (frontend + backend + database)
                sh "kubectl apply -f apps/"
            }
        }
    }
}
