pipeline{
    agent any 
    environment{
        VERSION = "${env.BUILD_ID}"
    }
    stages{
             
        stage("docker build & docker push"){
            steps{
                script{
                   withCredentials([usernamePassword(credentialsId: 'NexusId', passwordVariable: 'PASSWD', usernameVariable: 'USERNAME')]) {
    
                                sh '''
                                sudo docker build -t prakash:${VERSION} .
                                sudo docker login -u $USERNAME -p $PASSWD 34.100.164.198:8083
                                sudo docker push prakash:${VERSION}
                                sudo docker rmi prakash:${VERSION}
                                sudo docker image prune -f
                            '''
                     }
                }
            }
        }
    }
}


