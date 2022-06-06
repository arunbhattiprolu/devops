properties([[$class: 'BuildDiscarderProperty', strategy: [$class: 'LogRotator', artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '10']]]);
pipeline {
  environment {
    registry = "saiarun/devops"
    registry = "saiarun/firstimage"
    registryCredential = 'saiarun'
    dockerImage = ''
  }
   agent any 
   stages {
      stage('checkout code'){
       steps {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '84c7d5cb-15a4-44f7-a7a1-65b7fea17f22', url: 'https://github.com/arunbhattiprolu/devops.git']]])
       }

     }
     stage('Cloning our Git') {
      steps {
        git 'https://github.com/arunbhattiprolu/devops.git'
         }
     }
     stage('Building our image') {
      steps{
       script {
        dockerImage = docker.build registry + ":$BUILD_NUMBER"
          }
        }
      }
      stage('Deploy our image') {
       steps {
        script {
         docker.withRegistry( '', registryCredential ) {
          dockerImage.push()
           }
          }
        }
      }
      stage('HelloWorld') { 
        steps {
          echo 'Hello World'
        }
      } 
      
  }
}     
}  
   
