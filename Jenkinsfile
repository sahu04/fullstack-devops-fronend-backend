pipeline {
    agent any

    environment {
        IMAGE_NAME = "ubuntu_backend"
        CONTAINER_BLUE = "backend-blue"
        CONTAINER_GREEN = "backend-green"
        PORT_BLUE = "8001"
        PORT_GREEN = "8002"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/harishjangam235/fullstack-devops.git'
            }
        }

        stage('Build Backend Image') {
            steps {
                sh '''
                echo "Building backend image..."
                docker build -t $IMAGE_NAME ./backend
                '''
            }
        }

        stage('Blue-Green Deployment') {
            steps {
                script {

                    def runningBlue = sh(
                        script: "docker ps -q -f name=${CONTAINER_BLUE}",
                        returnStdout: true
                    ).trim()

                    def runningGreen = sh(
                        script: "docker ps -q -f name=${CONTAINER_GREEN}",
                        returnStdout: true
                    ).trim()

                    if (runningBlue) {

                        echo "Blue is running. Deploying Green..."

                        sh """
                        docker rm -f ${CONTAINER_GREEN} || true
                        docker run -d --name ${CONTAINER_GREEN} -p ${PORT_GREEN}:8000 ${IMAGE_NAME}
                        docker rm -f ${CONTAINER_BLUE}
                        """

                    } else {

                        echo "Green is running or first deployment. Deploying Blue..."

                        sh """
                        docker rm -f ${CONTAINER_BLUE} || true
                        docker run -d --name ${CONTAINER_BLUE} -p ${PORT_BLUE}:8000 ${IMAGE_NAME}
                        docker rm -f ${CONTAINER_GREEN} || true
                        """
                    }
                }
            }
        }
    }

    post {
        success {
            echo "Deployment Successful 🚀"
        }
        failure {
            echo "Deployment Failed ❌"
        }
    }
}
