pipeline {
    agent none

    triggers {
        cron('@daily')
    }

    stages {
        stage('Build Docker image') {
            agent {
                dockerfile true
            }
            steps {
                echo "building  image from Dockerfile"
                sh 'echo JENKINS_HOME = $JENKINS_HOME'
            }
        }
        stage('Build Java app') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v /root/.m2:/root/.m2'
                }
            }
            steps {
                echo "cleaning and packaging java app"
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
                stash includes: '**/target/', name: 'app'
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
                sh 'py.test --verbose --junit-xml test-reports/results.xml jenkins/pysrc/my_words_distance.py'
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
                branch 'dev'
            }
            steps {
                // sh 'npm install'
                unstash 'app'
                sh './my-mvn-sonar-run.sh'
                echo 'You may see all issues at https://sonarcloud.io/projects'
                // input message: 'Finished using the web site? (Click "Proceed" to continue)'
            }
        }
        stage('Review prod environment') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v /root/.m2:/root/.m2'
                }
            }
            when {
                branch 'prod'
            }
            steps {
                // sh 'npm install'
                sh 'printenv'
                input message: 'Approve Prod Environment? \n (Click "Proceed" to continue)'
            }
        }
        stage('Deliver') {
            parallel {
                stage('Deliver On Linux') {
                    agent {
                        docker {
                            image 'maven:3-alpine'
                            args '-v /root/.m2:/root/.m2'
                        }
                    }
                    steps {
                        unstash 'app'
                        echo "localy  installing and running the java app"
                        sh './scripts/deliver.sh'
                    }
                }
                stage('Deliver On Windows') {
                    // agent {
                    //    label "windows"
                    // }
                    steps {
                        echo "Template for parallel Delivery on Windows platform"
                    //    bat "./scripts/deliver.bat"
                    }
                }
            }
        }
        stage('Deploy') {
            parallel {
                stage('Deploy Maven pkg') {
                    agent {
                        docker {
                            image 'maven:3-alpine'
                            args '-v /root/.m2:/root/.m2'
                        }
                    }
                    steps {
                        unstash 'app'
                        echo "Deploying maven pkg"
                        // sh './scripts/mvn-deploy.sh'
                    }
                }
                stage('Deploy docker pkg') {
                    agent {
                        any
                    }
                    steps {
                        echo "Deploying docker pkg"
                        sh './scripts/dkr-deploy.sh vsilverman jenkinsci/blueocean jenbo latest'
                    }
                }
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