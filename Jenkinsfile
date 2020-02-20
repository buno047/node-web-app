pipeline {
    agent {
        kubernetes {
          //cloud 'kubernetes'
          label 'kaniko'
          yaml """
kind: Pod
metadata:
  name: kaniko
spec:
  containers:
  - name: kaniko
    image: gcr.io/kaniko-project/executor:debug-539ddefcae3fd6b411a95982a830d987f4214251
    imagePullPolicy: Always
    command:
    - cat
    tty: true
    volumeMounts:
      - name: kaniko-secret
        mountPath: /secret
    env:
      - name: GOOGLE_APPLICATION_CREDENTIALS
        value: /secret/kaniko-secret.json
  restartPolicy: Never
  volumes:
    - name: kaniko-secret
      secret:
        secretName: kaniko-secret
"""
      }
    }   

    stages {

        stage('Docker Build') {
            steps {
             container(name: 'kaniko') {
               sh '''
                    /kaniko/executor --dockerfile `pwd`/Dockerfile --context `pwd` --insecure --skip-tls-verify --destination=gcr.io/itserious/node-web-app

               '''
               }

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

