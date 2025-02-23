pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/your-repo/your-project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t yourdockerhub/faizraza-html:latest .'
            }
        }

        stage('Push to DockerHub') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-credentials', url: '']) {
                    sh 'docker push yourdockerhub/faizraza-html:latest'
                }
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker stop faizraza-container || true'
                sh 'docker rm faizraza-container || true'
                sh 'docker run -d -p 8080:80 --name faizraza-container yourdockerhub/faizraza-html:latest'
            }
        }
    }

    triggers {
        pollSCM('H/5 * * * *') // Check for changes every 5 minutes
    }
}
