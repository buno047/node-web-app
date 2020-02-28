pipeline {
    agent any
    
    environment {
        PROJECT_ID = 'itserious'
        CLUSTER_NAME = 'development-cluster'
        LOCATION = 'europe-north1-a'
        CREDENTIALS_ID = 'itserious'
    }

    stages {

        stage('Deploy to GKE') {
            steps{
                step([
                $class: 'KubernetesEngineBuilder',
                projectId: env.PROJECT_ID,
                clusterName: env.CLUSTER_NAME,
                location: env.LOCATION,
                manifestPattern: 'ci/',
                credentialsId: env.CREDENTIALS_ID,
                verifyDeployments: true])
            }
        }  
        
        }       

    }
    
}
