pipeline {
    agent { label: "default" }
      
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
