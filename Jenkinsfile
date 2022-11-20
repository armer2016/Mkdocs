pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh """
                docker build -t mkdocs:2.0.0 mkdocs/Dockerfile mkdocs/
                """
            }
        }
        stage('Deploy') {
            steps {
                sh """
                docker ps | grep -v "CONTAINER" | grep "mkdocs" | awk '{print\$1}' | xargs docker rm -f 2> /dev/null;
                docker run -d -p 8000:8000 mkdocs:2.0.0
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