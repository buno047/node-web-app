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
  - name: kubehelm
    image: dtzar/helm-kubectl
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
              step(withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'kubeconfigraw', namespace: '', serverUrl: '') {
    // some block
           sh 'helm version'
           sh 'kubectl version'
           sh 'kubectl config get-contexts'
           sh 'kubectl get pods -n itserious-test'
           sh 'helm list -n itserious-test'
           sh 'helm install music ./ci/mychart -n itserious-test'
           sh 'helm list -n itserious-test'
          })
            }
          
          }
    
      }
    
     stage('Finalization') {
 
          steps{
              
              step({
                // some block
                sh 'echo "Success"'
                   })
        
          }
    
      }   

    }
    
}
