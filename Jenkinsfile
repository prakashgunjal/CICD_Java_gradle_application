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
                                docker build -t cicdpipeline:${VERSION} .
                                docker login -u prakshgunjal -p Durva@0303
                                docker push prakshgunjal/cicdpipeline:${VERSION}
                                docker rmi 34.93.160.244:8081/Docker-Hosts:${VERSION}
                                docker image prune -f
                            '''
                     }
                }
            }
        }
    }
}


