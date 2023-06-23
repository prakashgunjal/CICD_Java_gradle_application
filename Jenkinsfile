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



