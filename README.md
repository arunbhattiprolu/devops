# Continous Integration and Continous Deployment.

Install cloud bees jenkins on the windows

https://docs.cloudbees.com/docs/cloudbees-jenkins-distribution/latest/distro-install-guide/windows/
Prerequisites - Java, JDk..

Configure Jenkins to listen on localhost:8080

Install git on the windows and configure the git path on windows in the Jenkins.
   Jenkins -> Mange Jenkins -> Global Tool Configurartion -> under Git Installation -> Add Git Installed path(C:\Program Files (x86)\Git\bin\git.exe) on the windows Machine.

# Trigger a build for Jenkins Pipeline from github using a webhook

1.
Login to github -> choose dropdown to the extreme right at Profile Icon -> select "your repositories"-> Devops(In this case)

Under username/repository -> find settings(for your repository) -> on the left navigation plane -> choose webhook option -> Add Webhook -> Provide yout github account password
 For configuring webhook please refer to this link https://dzone.com/articles/adding-a-github-webhook-in-your-jenkins-pipeline

As we understand from the above article that we need to place ngrok forwarding url instead of https://localhost:8080, we retreive that after the installation of ngrok tool and setting the path on the environment variable -> open the cmd as administrator -> type ngrok http 8080 to receive the list of urls -> http://127.0.0.1:4040 (webinterface url to check the request and responses to jenkins server),https://e4044974995f.ngrok.io/(forwarding url).

Place http://e4044974995f.ngrok.io/github-webhook/ under payload url.

2.
Now  login to Jenkins(http://e4044974995f.ngrok.io/) and choose option Managejenkins -> ConfigureSystem -> scrolldown and check if GitHub Pull Request Builder section is available 
else globalpullrequester plugin is installed.

Configure  GitHub Server API URL - https://api.github.com
           Credentials -> github credentials
           click on TestCredentials button          			
            Test basic connection to GitHub	
             Connected to https://api.github.com as null (null) login: arunbhattiprolu(click on connectoAPI button)
           check in automange webhooks checkbox
Apply and save
 
Configure Job -> choose Build Triggers section and checkboxes GitHub Pull Request Builder, Use github hooks for build triggering, GitHub hook trigger for GITScm polling.

Under Credentials -> click on the advanced button and fill in the following details
Name	origin
Refspec	+refs/pull/${ghprbPullId}/*:refs/remotes/origin/pr/${ghprbPullId}/*
Branches to build	
 Branch Specifier (blank for 'any') leave it blank to search for all branches or pull request id's 
 if the Branch Specifier is ${sha1}
 if the "base" branch and the "compare" branch can be merged
 this runs the test on the merged result, e.g. /origin/pr/4/merge
else
 this runs the test on the head of the compare branch, e.g. /origin/pr/4/head
 if the Branch Specifier is ${ghbprbActualCommit}
 this runs the test on the head of the compare branch, e.g. /origin/pr/4/head

Uncheck the Lightweight checkout checkbox
Apply and Save

3.
Now once git commit is  made to origin/feature branch using git push origin "feature_jenkins_update" , create a pull request to merge the commit from feature_jenkins -> master.

Navigate to jenkins server and verify to see the trigger build



           





