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
             
                step(withKubeConfig(caCertificate: 'eyJhbGciOiJSUzI1NiIsImtpZCI6IiJ9.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJpdHNlcmlvdXMtZGV2Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZWNyZXQubmFtZSI6ImplbmtpbnMtcm9ib3QtdG9rZW4tOGw4ODIiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiamVua2lucy1yb2JvdCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6ImIwZTViN2VjLTYzN2EtMTFlYS1iNTI5LTQyMDEwYWE2MDE0NCIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDppdHNlcmlvdXMtZGV2OmplbmtpbnMtcm9ib3QifQ.QlLEfAhbc2tcjEVD0xfb6vMW6CztnwxrYGAGo1R5Sfu3wxHsf3RHKjfUWp5dJqQByMjfNQVB9znQT-8XENjVFwBAPiyrg7JKDbdl8emhMU2j5iYjlio9YVyN3vqb4vV7qqfUJyrA7BMaveKvbCimXv9PPQIz9svE7zDvBet5G9bUqbKSodHW1L_NJHgmLvaho4D7uHIPVNHaL7EiAFFWq8_4LGtLvRJJKh9k8rSNCg1LE7odoVc21pp_4y9maSwOKA7WaJMnWEH0Clj-Iqsn2gSDYAhTBxGESwc8qo3DM28UwfLYPzF22NkekJ8Z22q4C-lghRah2y8_CWn2XnXRNA', clusterName: '', contextName: '', credentialsId: 'jenkins-robot', namespace: '', serverUrl: '') {
             sh 'helm version'
             sh 'kubectl version'
             sh 'kubectl config get-contexts'
             sh 'kubectl get pods -n itserious-jenkins'
              })
            
            
            }
          
          }
    
      }
       
    
    }
    
}
 // sh 'helm list -n itserious-test'
         //  sh 'helm install music ./ci/mychart -n itserious-test'
         //  sh 'helm list -n itserious-test'
