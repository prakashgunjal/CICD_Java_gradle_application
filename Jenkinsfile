pipeline{
    agent any 
    environment{
        VERSION = "${env.BUILD_ID}"
    }
    stages{
             
        stage("docker build & docker push"){
            steps{
                script{
                   withCredentials([string(credentialsId: 'DockerHub', variable: 'Docker')]) {
                            
                                sh '''
                                docker build -t  prakshgunjal/cicdpipeline:${VERSION} .
                                docker login -u admin -p $NexusPass 34.93.160.244:8081
                                docker push  3prakshgunjal/cicdpipeline:${VERSION}
                                docker rmi 34.93.160.244:8081/Docker-Hosts:${VERSION}
                                docker image prune -f
                            '''
                     }
                }
            }
        }
    }
}


