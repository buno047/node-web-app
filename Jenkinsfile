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
    
    environment {
        PROJECT_ID = 'itserious'
        CLUSTER_NAME = 'development-cluster'
        LOCATION = 'europe-north1-a'
        CREDENTIALS_ID = 'itserious'
    }

    stages {

        stage('Build with Kaniko') {
            environment {
              PATH = "/busybox:/kaniko:$PATH"
            }   
            steps {
             container(name: 'kaniko', shell: '/busybox/sh') {
               sh '''#!/busybox/sh
                    /kaniko/executor -f `pwd`/Dockerfile -c `pwd` --cache=true --insecure --skip-tls-verify --destination=eu.gcr.io/itserious/node-web-app:${BRANCH_NAME}-$BUILD_NUMBER
               '''
               }

            }
        
        }
      
        stage('Deploy to GKE') {
     
            steps{
                step([
                $class: 'KubernetesEngineBuilder',
                projectId: env.PROJECT_ID,
                clusterName: env.CLUSTER_NAME,
                location: env.LOCATION,
                manifestPattern: 'ci/helloworld.yml',
                credentialsId: env.CREDENTIALS_ID,
                verifyDeployments: true])
            }
        }        
 
    }
    
}
