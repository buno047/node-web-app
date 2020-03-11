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
              step(withKubeConfig(caCertificate: 'LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURDekNDQWZPZ0F3SUJBZ0lRSytnVDRZZ2FVcG5lRDc3aUkyWVkrakFOQmdrcWhraUc5dzBCQVFzRkFEQXYKTVMwd0t3WURWUVFERXlSbE1HUTBNekk0TWkwME16TTNMVFEwTVRndFlqVTJNQzAxWTJaaU4yWTBPRFU1WXpNdwpIaGNOTWpBd01UTXdNRE0wTkRJMldoY05NalV3TVRJNE1EUTBOREkyV2pBdk1TMHdLd1lEVlFRREV5UmxNR1EwCk16STRNaTAwTXpNM0xUUTBNVGd0WWpVMk1DMDFZMlppTjJZME9EVTVZek13Z2dFaU1BMEdDU3FHU0liM0RRRUIKQVFVQUE0SUJEd0F3Z2dFS0FvSUJBUUNPNkQ4VWl2NGFGTWI4SG5mUVBXZXJLdVhjai82bjR1bko3SUtGTlZKYQo0S3Q4YldVMzIxNit2SmcwNm5Hb3VHTEp6bExWKzRzcnhxYzQyUEkxeEJ3SDRCekJZTDY3eGR2NjVEOVBkY3BwCldYK2Zxa2QzdFNWNXAxcHNveEl5Q1RGNHZTQi9Qd0txazV4RjZwMVhUVUY4N0o3RFNmaHQ5SGhxT0l0aUFIZGIKL28xUjdkR05URjhEM2VaM3Fjb3hTUm5JR0p5YzRVTWR4M2Zkb1ZHMXBYc0ZMRk51U2RGR0RsOWVXYml1eVh6OAoxV1R4eWVXM0VJRmkvVjQ0NStONldocnRoMHFRV3hrSm13MDY5WjNIaDQ1VGRvZEpWNlVTeVUwaW5XMlBpbzJaCjA2QmJ5Sk4zcHU0NURsczczdXIrY0RHV0JmZFBLTDZaQTJNQTZWRXBrSm14QWdNQkFBR2pJekFoTUE0R0ExVWQKRHdFQi93UUVBd0lDQkRBUEJnTlZIUk1CQWY4RUJUQURBUUgvTUEwR0NTcUdTSWIzRFFFQkN3VUFBNElCQVFCUAp1RHVBR1RjaHlBbkJQWTNzQnFsS09uMHBpaGpBNThzd2ZVNm9WSXgzWDRWeVZtQXYvSit4OWV0MHgvOGdZT29pCkU4LzF6RFlXS1ZyTGpqT0xUMFhUdldmWVppdDRhVlptL2R3TGdmMDFvbzJ0cEVhdXZCSjR2ZDlpemUyYnRreHMKVy9SZldzWlFEUXUrb0Uyd1ZIcFo4NWFTVGtjWkNrZTFnblo4NEtXUjB1V1ZseENNVXVHM2xuT2RUenRTYWpRbQp5b0RzRmU4ejBzOHk0ZGpEMjN4YkxFVFQ4dGpPN25OS0tPTXBDVFpxS2tZUlhWenpNQ2xpendaRjBmRms1V2pnCjNnNndkVmN6dlhPMHZFQlVVR1VweDlkKzBBTzJ5OWR5N2w0S2MycDQ1QjdBaitVZnlEa1NUdUpueGJaeWxseXIKdG5QV3BoeGYwY1VUYXZwN21TLzIKLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=', clusterName: 'development-cluster', contextName: 'gke_itserious_europe-north1-a_development-cluster', credentialsId: 'jenkins-robot', namespace: 'itserious-dev', serverUrl: 'https://35.228.101.27') {
    sh 'kubectl get pods'
})
            }
          
          }
    
      }

    }
    
}
