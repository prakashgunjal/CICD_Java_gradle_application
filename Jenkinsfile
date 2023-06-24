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
                   withCredentials([string(credentialsId: 'nexusse', variable: 'DockerNex')]) {
        
                                 sh '''
                                sudo docker build -t 34.100.164.198:8083:$BUILD_NUMBER .
                                sudo docker login -u admin -p $DockerNex 34.100.164.198:8083
                                sudo docker push 34.100.164.198:8083:$BUILD_NUMBER
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



