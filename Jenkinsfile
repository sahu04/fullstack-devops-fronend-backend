pipeline {
    agent any

    environment {
        IMAGE_NAME = "ubuntu_backend"
        NETWORK = "ubuntu_appnet"
        DB_URL = "postgresql://devops:devops123@postgres:5432/devopsdb"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'git@github.com:harishjangam235/fullstack-devops.git'
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
                sh '''
                echo "Starting Blue-Green Deployment..."

                ACTIVE=$(docker ps --format '{{.Names}}' | grep backend-blue || true)

                if [ "$ACTIVE" = "backend-blue" ]; then
                    OLD="backend-blue"
                    NEW="backend-green"
                else
                    OLD="backend-green"
                    NEW="backend-blue"
                fi

                echo "Old container: $OLD"
                echo "New container: $NEW"

                echo "Removing old inactive container if exists..."
                docker rm -f $NEW || true

                echo "Starting new container..."
                docker run -d \
                  --name $NEW \
                  --network $NETWORK \
                  -e DATABASE_URL=$DB_URL \
                  $IMAGE_NAME

                echo "Waiting for app to boot..."
                sleep 10

                echo "Health check..."
                docker exec $NEW curl -f http://localhost:8000 || exit 1

                echo "Updating Nginx upstream..."

                cat > nginx.conf <<EOF
events {}

http {
    upstream backend {
        server $NEW:8000;
    }

    server {
        listen 80;

        location / {
            proxy_pass http://backend;
        }
    }
}
EOF

                docker cp nginx.conf nginx:/etc/nginx/nginx.conf
                docker exec nginx nginx -s reload

                echo "Stopping old container..."
                docker rm -f $OLD || true

                echo "Blue-Green Deployment Completed Successfully 🚀"
                '''
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
