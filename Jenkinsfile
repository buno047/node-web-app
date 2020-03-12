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
  - name: kubectl
    image: gcr.io/cloud-builders/kubectl
    command:
    - cat
    tty: true
  - name: kubehelm
    image: eu.gcr.io/itserious/ubuntu:1
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
        IMAGE_TAG = "eu.gcr.io/itserious/node-web-app:${env.BRANCH_NAME}-${env.BUILD_NUMBER}"
    }     
        
      
    stages {

      stage('Deploy to GKE') {
 
          steps{
            container('kubehelm') {
             
             script {
                  
               
                    withKubeConfig(credentialsId: 'jenkins-two', serverUrl: 'https://35.228.101.27') {
                          sh '''
                              helm list -n itserious-test
                              helm install music ./ci/mychart -n itserious-test
                              helm list -n itserious-test
                             '''
            
                   }  
       
                  
             } //script  
                     
            } //container
          
          } //steps
    
       } //stage

    } //stages
    
}

