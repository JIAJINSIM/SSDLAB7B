pipeline {
    agent none
    stages {
        stage('Integration UI Test') {
            parallel {
                stage('Deploy') {
                    agent any
                    steps {
                        script {
                            echo "Starting deployment..."
                            sh './jenkins/scripts/deploy.sh'
                            echo "Deployment completed."
                            input message: 'Finished using the web site? (Click "Proceed" to continue)'
                            echo "Killing existing container..."
                            sh './jenkins/scripts/kill.sh'
                            echo "Container killed."
                        }
                    }
                }
                stage('Headless Browser Test') {
                    agent {
                        docker {
                            image 'maven:3-alpine' 
                            args '-v /root/.m2:/root/.m2' 
                        }
                    }
                    steps {
                        script {
                            echo "Starting Maven build..."
                            sh 'mvn -B -DskipTests clean package'
                            echo "Running Maven tests..."
                            sh 'mvn test'
                        }
                    }
                    post {
                        always {
                            script {
                                echo "Publishing test results..."
                                junit 'target/surefire-reports/*.xml'
                            }
                        }
                    }
                }
            }
        }
    }
}
