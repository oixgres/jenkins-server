pipeline{
    agent any
    environment{
        DOCKER_PWD = credentials('dockerhub')
    }
    stages{
        stage('Build'){
            steps{                    
                    sh 'dockerd & > /dev/null'
                    sleep(time: 10, unit: "SECONDS")
                    sh 'docker buildx build --network=host --platform=linux/amd64 --tag="oixgres/utils:jenkins" -f Dockerfile .'
                }
            }
        stage('Publish'){
            steps{
                sh 'echo $DOCKER_PWD | docker login --username oixgres --password-stdin'
                sh 'docker push "oixgres/utils:jenkins"'
            }
        }
    }

}