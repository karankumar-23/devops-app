pipeline {
    agent any
    environment {
        IMAGE_NAME = "devops-html-app"
        CONTAINER_NAME = "devops-container"
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/karankumar-23/devops-app.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }
        stage('Stop Old Container') {
            steps {
                sh '''
                    docker stop $CONTAINER_NAME || true
                    docker rm $CONTAINER_NAME || true
                '''
            }
        }
        stage('Deploy Container') {
            steps {
                sh 'docker run -d --name $CONTAINER_NAME -p 80:80 $IMAGE_NAME'
            }
        }
    }
    post {
        success { echo 'Deployment successful!' }
        failure  { echo 'Deployment failed!' }
    }
}

