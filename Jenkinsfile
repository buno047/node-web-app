
pipeline {

    agent any

    environment {
        PROJECT_ID = 'itserious'
        CLUSTER_NAME = 'development-cluster'
        LOCATION = 'europe-north1-a'
        CREDENTIALS_ID = 'itserious'
    }

    stages {
         
        stage('kubectl install') {
            https://github.com/buno047/node-web-app.git
            steps{
              sh '.script.sh'
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
