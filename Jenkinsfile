pipeline {

    agent {
        kubernetes {
          //cloud 'kubernetes'
          yaml """
           kind: Pod
           metadata:
             name: kaniko
           spec:
             containers:
             - name: kaniko
               image: gcr.io/kaniko-project/executor:latest
               imagePullPolicy: Always
               volumeMounts:
                 - name: kaniko-secret
                   mountPath: /secret
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
                    /kaniko/executor --dockerfile `pwd`/Dockerfile --context `pwd` --destination=gcr.io/itserious/node-web-app

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

