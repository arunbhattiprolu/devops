properties([[$class: 'BuildDiscarderProperty', strategy: [$class: 'LogRotator', artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '10']]]);
pipeline {
   agent {

      docker {
            image 'maven:3-alpine'
            args '-v $HOME/.m2:/root/.m2'
        }
        
   }
   stages {
      stage('checkout code'){
       steps {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '84c7d5cb-15a4-44f7-a7a1-65b7fea17f22', url: 'https://github.com/arunbhattiprolu/devops.git']]])
       }

     }
      stage('HelloWorld') { 
        steps {
          echo 'Hello World'
      }
    }
      stage('Build') {
            steps {
                sh 'mvn -B'
            }
        }
      
   }
 }     
   
