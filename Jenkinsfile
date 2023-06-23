pipeline{
    agent any 
    environment{
        VERSION = "${env.BUILD_ID}"
    }
    stages{
        stage('sonar quality check') {
            agent{
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

                }  
            } 
        }      
        stage("docker build & docker push"){
            steps{
                script{
                   withCredentials([string(credentialsId: 'nexusse', variable: 'nexussecrate')]) {
    
                                sh '''
                                sudo docker build -t prakash:${VERSION} .
                                sudo docker login -u admin -p $nexussecrate 34.100.164.198:8083
                                sudo docker push 34.100.164.198:8083/prakash:${VERSION}
                                sudo docker rmi prakash:${VERSION}
                                
                            '''
                     }
                }
            }
        }
        stage('indentifying misconfigs using datree in helm charts'){
            steps{
                script{

                    dir('kubernetes/') {
                            sh 'helm datree test myapp/'
                    }
                }
            }
        }
     
    }
}



