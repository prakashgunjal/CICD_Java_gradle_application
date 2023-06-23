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
                    withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'PASSWD', usernameVariable: 'USERNAME')]) {
    
                                 sh '''
                                sudo docker build -t prakshgunjal/cicdpipeline:$BUILD_NUMBER .
                                sudo docker login -u $USERNAME -p $PASSWD
                                sudo docker push prakshgunjal/cicdpipeline:$BUILD_NUMBER
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



