pipeline{
    agent any 
    environment{
        VERSION = "${env.BUILD_ID}"
    }
    stages{
             
        stage("docker build & docker push"){
            steps{
                script{
                   withCredentials([string(credentialsId: 'NexusPasswrd', variable: 'NexusPass')]) {
                        
                                sh '''
                                docker build -t  34.93.160.244:8081/Docker-Hosts:${VERSION} .
                                docker login -u admin -p $NexusPass 34.93.160.244:8081
                                docker push  34.93.160.244:8081/Docker-Hosts:${VERSION}
                                docker rmi 34.93.160.244:8081/Docker-Hosts:${VERSION}
                                docker image prune -f
                            '''
                     }
                }
            }
        }
    }
}


