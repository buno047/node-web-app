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
    containers:
  - name: golang
    image: golang:1.10
    command:
    - cat
    tty: true
  - name: gcloud
    image: gcr.io/cloud-builders/gcloud
    command:
    - cat
    tty: true
  - name: kubectl
    image: gcr.io/cloud-builders/kubectl
    command:
    - cat
    tty: true
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
        
        stage('Deploy to GKE') {
 
          steps{
            container('kubectl') {
              step([$class: 'KubernetesEngineBuilder',namespace:'itserious-dev', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'ci/helloworld.yml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
            }
          }
        }
    

    }
    
}
