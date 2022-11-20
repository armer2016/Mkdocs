pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh """
                docker build -t mkdocs:4.0.${BUILD_NUMBER} -f ./Dockerfile .
                """
            }
        }
        stage('Deploy') {
            steps {
                sh """
                docker run -d -p 8000:8000 mkdocs:4.0.${BUILD_NUMBER}
                """
            }
        }
        stage('Test') {
            steps {
                sh """
                curl -IL localhost:8000
                """
            }
        }
    }
}