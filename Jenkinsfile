pipeline {
    agent any
    environment {
        IMAGE_NAME = 'alpine'
        IMAGE_TAG = "${BUILD_NUMBER}"
        DOCKER_HUB_REPO = 'krishnna/jenkins_repo'
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
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
                    docker.build("${DOCKER_HUB_REPO}:${IMAGE_TAG}")
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker_hub_creds', usernameVariable: 'krishnna', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$krishnna" --password-stdin
                        docker push ${DOCKER_HUB_REPO}:${IMAGE_TAG}                    
                    '''
                }
            }
        }

        stage('Install Tools') {
    steps {
        sh '''
            apt-get update
            apt-get install -y gettext-base
        '''
    }
}

     stage('Deploy to kubernetes') {
    steps {
        withCredentials([file(credentialsId: 'kubernetes_creds', variable: 'kubeconfig')]) {
              sh '''
                envsubst < deployment.yaml > deployment-rendered.yaml 
                kubectl apply -f deployment-rendered.yaml --validate=false
                kubectl apply -f service.yaml
              '''
        }
    }
}


    }
}
