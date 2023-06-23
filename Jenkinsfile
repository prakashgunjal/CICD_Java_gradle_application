pipeline{
    agent any 
    environment{
        VERSION = "${env.BUILD_ID}"
    }
    stages{
             
        stage("docker build & docker push"){
            steps{
                script{
                   withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'PASSWD', usernameVariable: 'USERNAME')]) {
    
                                sh '''
                                sudo docker build -t prakshgunjal/cicdpipeline:$BUILD_NUMBER .
                                sudo docker login -u $USERNAME -p $PASSWD
                                sudo docker push prakshgunjal/cicdpipeline:${VERSION}
                                sudo docker rmi prakshgunjal/cicdpipeline:${VERSION}
                                sudo docker image prune -f
                            '''
                     }
                }
            }
        }
    }
}


