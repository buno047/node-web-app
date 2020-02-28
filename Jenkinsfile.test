pipeline {
    agent any

    stages {

        stage('List pods') {
            
          steps {  
            withKubeConfig([caCertificate: '', clusterName: '', contextName: '', credentialsId: 'jenkins-robot-token', namespace: 'itserious-dev', serverUrl: '']) {
        // some block
               sh '''
                    kubectl get pods --namespace=itserious-dev
               '''
            }  
          
          }  
        
        }       

    }
    
}
