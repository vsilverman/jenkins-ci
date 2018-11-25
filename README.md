# Demo of Continuous Integration
This repo shows how to use docker, jenkins and maven to build, test and deploy java app

## Steps to Execute This Demo

-	Clone this sample by using e.g. the following command:

			git clone <git-address-of-this-repo>

-   Run the referenced docker image from the terminal window:

            ./dkr-jenkinsci-start.sh
            
-   After container starts get Jenkins admin password from another terminal window:

            docker cp my-jenkins-ci:/var/jenkins_home/secrets/initialAdminPassword .
            cat initialAdminPassword

-   Point your browser to https://localhost:8080 and unlock Jenkins by entering
    obtained admin password.  After that create a new admin user with demo/demo
    (login_name/password) credentials.
    
-   Now you can build and test a Java app, which will demo automatic authentication
    with newly created Jenkins account. To do this simply run the following command:
    
            mvn clean package
    
-   Create a new Pipeline job in Jenkins.  Configure this Pipeline by entering under 
    "Repository URL" : "/home/jenkins-ci/" and under "Script Path" : "Jenkinsfile".
    Save configured job and run it.
    
-   While a pipeline job is running click on "Open Blue Ocean" link and verify that
    all tests are passed and that current build of the app is ready for demonstration.
    
   