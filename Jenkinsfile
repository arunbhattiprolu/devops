#validate
properties([[$class: 'BuildDiscarderProperty', strategy: [$class: 'LogRotator', artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '10']]]);
pipeline {
   agent any
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
      stage('checkout this code'){
         steps{
            dir('multimodule'){
                stash includes: '/Sources/**/*', name: 'Sources'
          }
      }
      stage('reuse the code'){
         steps{
        unstash 'sources'
         }
      }
  }
 }
}      
   
