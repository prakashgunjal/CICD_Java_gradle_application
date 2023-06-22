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
                                docker login -u $USERNAME -p $PASSWD
                                docker push prakshgunjal/cicdpipeline:${VERSION}
                                docker rmi prakshgunjal/cicdpipeline:${VERSION}
                                docker image prune -f
                            '''
                     }
                }
            }
        }
    }
}


