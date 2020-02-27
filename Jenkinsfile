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
    image: gcr.io/kaniko-project/executor:debug
    imagePullPolicy: Always
    command:
    - /busybox/cat
    tty: true
    volumeMounts:
      - name: kaniko-secret
        mountPath: /secret
    env:
      - name: GOOGLE_APPLICATION_CREDENTIALS
        value: /secret/kaniko-secret.json
  volumes:
    - name: kaniko-secret
      secret:
        secretName: kaniko-secret
"""
      }
    }   

    stages {

        stage('Build with Kaniko') {
            environment {
              PATH = "/busybox:/kaniko:$PATH"
            }   
            steps {
             container(name: 'kaniko', shell: '/busybox/sh') {
               sh '''#!/busybox/sh
                    /kaniko/executor -f `pwd`/Dockerfile -c `pwd` --cache=true --insecure --skip-tls-verify --destination=eu.gcr.io/itserious/node-web-app:$BUILD_NUMBER

               '''
               }

            }

        }
        stage('List pods') {
          withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'jenkins-robot-token', namespace: 'itserious-dev', serverUrl: '') {
        // some block
               sh 'kubectl get pods'
        }

    }
    
}

