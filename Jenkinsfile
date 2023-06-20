pipeline{
    agent any 
    environment{
        VERSION = "${env.BUILD_ID}"
    }
    stages{
        stage("sonar quality start check"){
            agent {
                any {
                    image 'openjdk:11'
                }
            }
            steps{
                script{
                    withSonarQubeEnv(credentialsId: 'SonarQube') {
                            sh 'chmod +x gradlew'
                            sh './gradlew sonarqube'
                    }

                    timeout(2) {
                    }
                }
            }  
        }
        
        stage("docker build & docker push"){
            steps{
                script{
                   withCredentials([string(credentialsId: 'NexusPasswrd', variable: 'NexusPass')]) {
                        
                                sh '''
                                docker build -t 34.93.11.250:8083/Docker-Hosts:${VERSION} .
                                docker login -u admin -p $NexusPass 34.93.11.250:8083
                                docker push  34.93.11.250:8083/Docker-Hosts:${VERSION}
                                docker rmi 34.93.11.250:8083/Docker-Hosts:${VERSION}
                                docker image prune -f
                            '''
                     }
                }
            }
        }
    }
}


