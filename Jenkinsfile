pipeline{
    agent any 
    environment{
        VERSION = "${env.BUILD_ID}"
    }
    stages{
             
        stage("docker build & docker push"){
            steps{
                script{
                   withCredentials([string(credentialsId: 'nexusse', variable: 'nexussecrate')]) {
    
                                sh '''
                                sudo docker build -t docker/prakash:${VERSION} .
                                sudo docker login -u admin -p $nexussecrate 34.100.164.198:8083
                                sudo docker push docker/prakash:${VERSION}
                                sudo docker rmi docker/prakash:${VERSION}
                                sudo docker image prune -f
                            '''
                     }
                }
            }
        }
    }
}


