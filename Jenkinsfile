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
        }
        stage("docker build & docker push"){
            steps{
                script{
                    withCredentials([string(credentialsId: 'Nexus_token', variable: 'Nexus_token')]) {
                            sh '''
                                docker build -t 34.93.11.250:8083/prakashapp:${VERSION} .
                                docker login -u admin -p $Nexus_token 34.93.11.250:8083
                                docker push  34.93.11.250.81:8083/prakashapp:${VERSION}
                                docker rmi 34.93.11.250:8083/prakashapp:${VERSION}
                                docker image prune -f
                            '''
                     }
                }
            }
        }
    }
}


