pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'test'
    }

    stages {
        stage('Build') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    docker.image(DOCKER_IMAGE).inside('-u root') {
                        sh 'npm install --unsafe-perm'
                        sh 'npm test'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    docker.image(DOCKER_IMAGE).run('-d -p 3003:3000')
                }
            }
        }
    }
}