# Demo of Continuous Integration

This repo shows how to use dockerized jenkins to build, test and deploy java and python apps. For testing java app this demo is using maven and python app is tested with pytest.

## Steps to Execute This Demo

- Clone this sample by using e.g. the following command:

            git clone <git-address-of-this-repo>

- Build your own ubuntu based docker image and install on it all needed components,
including java, jenkins, etc.:

            docker build -t <image-you-are-building> .

- Advantage of above approach - you have full control of what
to include in your newly built image. You need to remember though to install
jenkins blue ocean plugins, required for this demo.

- Alternative approach is to use the pre-built docker image with already
installed jenkins blue-ocean plugins. For doing this run from the terminal window:

            ./dkr-jenkinsci-start.sh

- After container starts get Jenkins admin password from another terminal window:

            docker cp my-jenkins-ci:/var/jenkins_home/secrets/initialAdminPassword .
            cat initialAdminPassword

- Point your browser to <https://localhost:8080> and unlock Jenkins by entering
obtained admin password.  After that create a new admin user with demo/demo
(login_name/password) credentials.

- Now you can build and test a Java app, which will demo automatic authentication
with newly created Jenkins account. To do this simply run the following command:

            mvn clean package

- Create a new Pipeline job in Jenkins.  Configure this Pipeline by entering under
"Repository URL" : "/home/jenkins-ci/" and under "Script Path" : "Jenkinsfile".
Save configured job and run it.

- While a pipeline job is running click on "Open Blue Ocean" link and verify that
all tests are passed and that current build of the app is ready for demonstration.

- After executing this demo you can test entire project against running instance
of Jenkins.  For executing such tests inside e.g. InteliJ IDE do the following:
  - import IntelliJ settings of this project
  - right click on test->java->com.mycompany.app
  - select 'Run all tests'. Tests will be executed using JUnit and Cucumber frameworks.
  - observe results and duration of every test.

- To simplify execution of this demo and visualize entire process you may follow
a more detailed overview document, located at this
[Continuous Integration Page][https://github.com/vsilverman/jenkins-ci/wiki/Jenkins-Continuos-Integration]

- Above demo shows example of building customized docker images
and including those in multi-platform CI/CD process using declarative
Jenkins pipeline. In case you need to include in the pipeline
deployment process for the built image - follow current project
instructions on using terraform for
[building deployment infrastructure](https://github.com/vsilverman/jenkins-ci/tree/master/terraform).
And in case you need to build DevOps and Test environments
using other infrastructure-as-a-code tools - you may follow
[Insight project instructions](https://github.com/vsilverman/insight)

- Remember that described above process and documentation may be always
used as a template. In case you need to meet certain other
goals - just integrate current framework with proper data
pipeline or piece of software, build new app and rerun the
entire demo.

[https://github.com/vsilverman/jenkins-ci/wiki/Jenkins-Continuos-Integration]: https://github.com/vsilverman/jenkins-ci/wiki/Jenkins-Continuos-Integration
