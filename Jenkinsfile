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
    
    stages {

      stage('Deploy to GKE') {
 
          steps{
            container('kubectl') {
              step(withKubeConfig(caCertificate: '', clusterName: 'development-cluster', contextName: 'gke_itserious_europe-north1-a_development-cluster', credentialsId: 'jenkins-robot', namespace: '', serverUrl: 'https://35.228.101.27') {
           sh 'kubectl version'
           sh 'kubectl get pods'
})
            }
          
          }
    
      }

    }
    
}
