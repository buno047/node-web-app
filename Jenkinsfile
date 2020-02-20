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
    image: gcr.io/kaniko-project/executor:latest
    imagePullPolicy: Always
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
               sh '''#!/busybox/sh
                    /kaniko/executor --dockerfile `pwd`/Dockerfile --context `pwd` --insecure --skip-tls-verify --destination=gcr.io/itserious/node-web-app:latest

               '''
               }

            }

        }

    }
}

