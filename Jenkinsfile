pipeline {
    agent none
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v /root/.m2:/root/.m2'
                }
            }
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Build Python app') {
            agent {
                docker {
                    image 'python:2-alpine'
                }
            }
            steps {
                sh 'python -m py_compile jenkins/pysrc/JenkinsDemoLoginTest.py'
            }
        }
        stage('Test') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v /root/.m2:/root/.m2'
                }
            }
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Test Python app') {
            agent {
                docker {
                    image 'qnib/pytest'
                }
            }
            steps {
                sh 'pip install selenium'
                sh 'get-chrome-driver.sh'
                sh 'py.test --verbose --junit-xml test-reports/results.xml jenkins/pysrc/JenkinsDemoLoginTest.py'
            }
            post {
                always {
                    junit 'test-reports/results.xml'
                }
            }
        }
        stage('Publish for dev') {
            when {
                branch 'development'
            }
            steps {
                // sh 'npm install'
                //  sh './jenkins/scripts/deliver.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                //  sh './jenkins/scripts/kill.sh'
            }
        }
        stage('Deliver') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v /root/.m2:/root/.m2'
                }
            }
            steps {
                sh './jenkins/scripts/deliver.sh'
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
}