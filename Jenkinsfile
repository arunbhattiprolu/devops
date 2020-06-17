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
      stage('stashing file'){
         steps{
      	    dir('multimodule'){
                stash includes: '/Sources/**/*', name: 'Sources'
          }
        }
      }
      stage('reuse the code'){
         steps{
      	unstash 'sources'
         }
      }
      stage("Env Variables") {
            steps {
                echo "The build ID is ${env.BUILD_ID}"
                echo "The build url is ${env.BUILD_URL}"
                echo "The Jenkins url is ${JENKINS_URL}"
                echo "The Node name is ${NODE_NAME}"
                echo "The Jenkins Home is ${JENKINS_HOME}"
                echo "Work Space is ${WORkSPACE}"
               echo "Build Tag is ${BUILD_TAG}"
               
            }
        },
         stage("Build Count"){
            steps{
               for i in {jobname1};
                  do count = $(curl -s http://http://localhost:8080/sample/$i/api/json?tree\=nextBuildNumber | jq . nextBuildNumber-1) && echo "\nJobName: $i |nNUmber of builds:$count", done;)
            }
         
         }
   }
 }
