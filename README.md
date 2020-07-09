# Continous Integration and Continous Deployment.

Install cloud bees jenkins on the windows

https://docs.cloudbees.com/docs/cloudbees-jenkins-distribution/latest/distro-install-guide/windows/
Prerequisites - Java, JDk..

Configure Jenkins to listen on localhost:8080

Install git on the windows and configure the git path on windows in the Jenkins.
   Jenkins -> Mange Jenkins -> Global Tool Configurartion -> under Git Installation -> Add Git Installed path(C:\Program Files (x86)\Git\bin\git.exe) on the windows Machine.

# Trigger a build for Jenkins Pipeline from github using a webhook

Login to github -> choose dropdown to the extreme right at Profile Icon -> select "your repositories"-> Devops(In this case)

Under username/repository -> find settings(for your repository) -> on the left navigation plane -> choose webhook option -> Add Webhook -> Provide yout github account password
 For configuring webhook please refer to this link https://dzone.com/articles/adding-a-github-webhook-in-your-jenkins-pipeline

As we understand from the above article that we need to place ngrok forwarding url instead of https://localhost:8080, we retreive that after the installation of ngrok tool and setting the path on the environment variable -> open the cmd as administrator -> type ngrok http 8080 to receive the list of urls -> http://127.0.0.1:4040 (webinterface url to check the request and responses to jenkins server),https://e4044974995f.ngrok.io/(forwarding url).

Place http://e4044974995f.ngrok.io/github-webhook/ under payload url.

Now  login to Jenkins(http://e4044974995f.ngrok.io/) and choose option Managejenkins -> ConfigureSystem -> scrolldown and check if GitHub Pull Request Builder section is available 
else globalpullrequester plugin is installed.

Configure  GitHub Server API URL - https://api.github.com
           Credentials -> github credentials
           click on TestCredentials button          			
            Test basic connection to GitHub	
             Connected to https://api.github.com as null (null) login: arunbhattiprolu(click on connectoAPI button)
           check in automange webhooks checkbox
Apply and save
            






