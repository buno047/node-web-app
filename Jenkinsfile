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
    
    stages {

      stage('Deploy to GKE') {
 
          steps{
            container('kubehelm') {
              step(withKubeConfig(caCertificate: '', clusterName: 'development-cluster', contextName: 'gke_itserious_europe-north1-a_development-cluster', credentialsId: 'kubeconfigraw', namespace: 'itserious-test', serverUrl: 'https://35.228.101.27') {
    // some block
           sh 'helm version'
           sh 'kubectl version'
           sh 'kubectl config get-contexts'
           sh 'kubectl get pods -n itserious-test'
          // sh 'helm list -n itserious-test'
         //  sh 'helm install music ./ci/mychart -n itserious-test'
         //  sh 'helm list -n itserious-test'
          })
            }
          
          }
    
      }
       
    
    }
    
}
