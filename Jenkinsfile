pipeline {
  agent any
  stages {
    stage('Build') {
      agent {
        docker {
          image 'maven:3-alpine'
          args '-v /root/.m2:/root/.m2'
        }

      }
      steps {
        echo '"building..."'
        sh 'mvn -v'
      }
    }

    stage('Test') {
      agent {
        docker {
          image 'maven:3-alpine'
          args '-v /root/.m2:/root/.m2'
        }

      }
      post {
        always {
          junit 'target/surefire-reports/*.xml'
        }

      }
      steps {
        sh 'mvn test'
        stash(includes: '**/target/', name: 'app')
      }
    }

    stage('Publish for dev') {
      agent {
        docker {
          image 'maven:3-alpine'
          args '-v /root/:/root/'
        }

      }
      when {
        branch 'dev'
      }
      steps {
        unstash 'app'
        echo 'You may see all issues at https://sonarcloud.io/projects'
      }
    }

    stage('Deliver On Windows') {
      steps {
        echo 'Template for parallel Delivery on Windows platform'
      }
    }

    stage('Deploy docker pkg') {
      agent any
      steps {
        echo 'Deploying docker pkg'
        sh './scripts/dkr-deploy.sh vsilverman jenkinsci/blueocean jenbo latest'
      }
    }

    stage('Demo') {
      when {
        expression {
          currentBuild.result == null || currentBuild.result == 'SUCCESS'
        }

      }
      steps {
        echo "Build ${env.BUILD_ID} on ${env.JENKINS_URL} is ready for Demo"
      }
    }

  }
  triggers {
    cron('@daily')
  }
}