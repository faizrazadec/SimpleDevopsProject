pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'stable', url: 'https://github.com/faizrazadec/SimpleDevopsProject.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t faizrazadec/simple_devops:latest .'
            }
        }

        stage('Push to DockerHub') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-credentials', url: '']) {
                    sh 'docker push faizrazadec/simple_devops:latest'
                }
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker stop faizraza-container || true'
                sh 'docker rm faizraza-container || true'
                sh 'docker run -d -p 8081:80 --name faizraza-container faizrazadec/simple_devops:latest'
            }
        }
    }

    triggers {
        pollSCM('H/5 * * * *') // Check for changes every 5 minutes
    }
}
