pipeline {
    agent any
    environment {
        IMAGE_NAME = 'alpine'
        IMAGE_TAG = "${BUILD_NUMBER}"
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
    }
}
