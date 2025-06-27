pipeline {
    agent any
    environment {
        IMAGE_NAME = 'alpine'
        IMAGE_TAG = "${BUILD_NUMBER}"
        DOCKER_HUB_REPO = 'krishnna/jenkins_repo'
    }
    stages {
        stage('Hello') {
            steps {
                echo 'Hello, Jenkins! This is my first job.'
            }
        }

        stage('Check Docker') {
    steps {
        sh 'docker version'
    }
}

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:${IMAGE_TAG}")
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker_hub_creds', usernameVariable: 'krishnna', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$krishnna" --password-stdin
                        docker push ${IMAGE_NAME}:${IMAGE_TAG}                    
                    '''
                }
            }
        }
    }
}
