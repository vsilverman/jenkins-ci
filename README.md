# Demo of Continuous Integration
This repo shows how to use dockerized jenkins to build, test and deploy java and python apps. For testing java app this demo is using maven and python app is tested with pytest.

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
    
-   After executing this demo you can test entire project against running instance
    of Jenkins.  For executing such tests inside e.g. InteliJ IDE doe the following:
    - import IntelliJ settings of this project
    - right click on test->java->com.mycompany.app
    - select 'Run all tests'. Tests will be executed using JUnit and Cucumber frameworks.
    - observe results and duration of every test.
    
-   To simplify execution of this demo and visualize entire process you may follow 
    a more detailed overview document, located at this
    [Continuous Integration Page][https://github.com/vsilverman/jenkins-ci/wiki/Jenkins-Continuos-Integration]
    
-   Remember that described above process and documentation may be always used as a template.
    In case you need to meet certain goals integrate current framework with proper data
    pipeline or piece of software, build new app and rerun the entire demo.

[https://github.com/vsilverman/jenkins-ci/wiki/Jenkins-Continuos-Integration]: https://github.com/vsilverman/jenkins-ci/wiki/Jenkins-Continuos-Integration