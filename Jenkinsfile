pipeline {
	agent any
    environment {
        unit_test = true
    }
    stages {
        stage('Build&Test') {
            agent {
                docker {
                    image 'maven:3-jdk-8-alpine'
                    args '-v $HOME/.m2:/root/.m2'
                }
            }
            steps {
                echo 'Build&Test'
                sh 'mvn -B -DskipTests clean package'
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('build image') {
            steps {
                sh "if (docker ps|grep app-one) then (docker stop app-one && docker rm app-one) fi"
                sh "if (docker images|grep app-one) then (docker rmi \$(docker images app-one -q)) fi"
                sh 'docker build -t app-one .'
            }
        }
        stage('deliver') {
            steps{
                sh "docker run -p 8082:8080 --name app-one -v /log:/log -d app-one"
            }

        }
    }
}