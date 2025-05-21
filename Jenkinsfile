pipeline{
    agent any
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
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'PWD', usernameVariable: 'USR')]){
                    sh 'docker login --username ${USR} -p $PWD'
                    sh 'docker push "oixgres/utils:jenkins"'
                }

            }
        }
    }

}