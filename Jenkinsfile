
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
     
            steps{
                sh '''#!/bin/bash
                  curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.17.0/bin/linux/amd64/kubectl
                  chmod +x ./kubectl
                  sudo mv ./kubectl /usr/local/bin/kubectl
                  kubectl version --client
                '''
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
