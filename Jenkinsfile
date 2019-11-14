pipeline {
    agent none
    stages {
        stage('Build Java app') {
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
                echo "compiling all python source files"
                sh 'python -m py_compile jenkins/pysrc/*.py'
            }
        }
        stage('Test Java app') {
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
                // sh 'pip install --upgrade pip && pip install selenium'
                // sh 'py.test --verbose --junit-xml test-reports/results.xml jenkins/pysrc/JenkinsDemoLoginTest.py'
                sh 'py.test --verbose --junit-xml test-reports/results.xml jenkins/pysrc/JokeOfTheDayTest.py'
            }
            post {
                always {
                    junit 'test-reports/results.xml'
                }
            }
        }
        stage('Publish for dev') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v /root/.m2:/root/.m2'
                }
            }
            when {
                branch 'development'
            }
            steps {
                // sh 'npm install'
                //  sh './jenkins/scripts/deliver.sh'
                sh './mvn-sonar-run.sh'
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
                echo "localy installing and running the java app"
                sh './scripts/deliver.sh'
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