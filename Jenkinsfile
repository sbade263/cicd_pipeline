pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'sbade263/my-web-app'
        DOCKER_REGISTRY = 'docker.io'
        DOCKER_CREDENTIALS = 'docker-hub-credentials-id'  // Replace with your credentials ID
    }

    stages {
        stage('Checkout') {
            steps {
                // Pull the code from the GitHub repository
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using the Dockerfile in the repository
                    sh 'docker build -t ${DOCKER_IMAGE}:${BUILD_NUMBER} .'
                }
            }
        }
        
        stage('Login to Docker Hub') {
            steps {
                script {
                    // Log in to Docker Hub using the Jenkins credentials manager
                    withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS}", usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    sh "docker push ${DOCKER_IMAGE}:${BUILD_NUMBER}"
                }
            }
        }
    }

    post {
        always {
            // Clean up workspace after the pipeline completes
            cleanWs()
        }
    }
}
