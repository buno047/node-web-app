pipeline {

    agent any

    stages {

        stage('Docker Build') {
            steps {
                sh '''
                    docker build . -t shib047/node-web-app

                '''
            }

        }

        stage('Push to Docker') {
            steps {
                sh '''
                    echo "work in progress"

                '''
            }

        }

    }
}

