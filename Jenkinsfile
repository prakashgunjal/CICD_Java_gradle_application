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
                                sudo docker build -t  34.100.164.198:8083/prakash:$BUILD_NUMBER .
                                sudo docker login -u $USERNAME -p $PASSWD
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


