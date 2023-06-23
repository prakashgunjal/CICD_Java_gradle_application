pipeline{
    agent any 
    environment{
        VERSION = "${env.BUILD_ID}"
    }
    stages{
             
        stage("docker build & docker push"){
            steps{
                script{
                   withCredentials([string(credentialsId: 'NexusPasswrd', variable: 'Nexus')]) {
    
                                sh '''
                                sudo docker build -t 34.100.164.198:8083/prakash:$BUILD_NUMBER .
                                sudo docker login -u admin -p $Nexus
                                sudo docker push 34.100.164.198/prakash:${VERSION}
                                sudo docker rmi 34.100.164.198/prakash:${VERSION}
                                sudo docker image prune -f
                            '''
                     }
                }
            }
        }
    }
}


