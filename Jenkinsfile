pipeline {
  environment {
    imagename = "101-docker-images"
    dockerImage = ''
    appNodeIP = '10.12.2.142'
    appNodeUser = 'ubuntu'
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git([url: 'https://github.com/upgrad-c7-course-project/nodeapp.git', branch: 'main', credentialsId: 'upgrad-c7-course-project'])

      }
    }

    stage('Build and publish image') {
        steps{
            script {
              docker.withRegistry(
                'https://969361958776.dkr.ecr.us-east-1.amazonaws.com',
                'ecr:us-east-1:aws.credentials'
                ) {

                dockerImage = docker.build('101-docker-images')
                dockerImage.push('latest')
              }
            }
        }
    }


    stage('deploy to app host') {
      steps{
 
        sshagent() {
            sh "ssh -o StrictHostKeyChecking=no -l $appNodeUser $appNodeIP 'echo hello'"
        }

        // sh "docker rmi $imagename:$BUILD_NUMBER"
        // sh "docker rmi $imagename:latest"

      }
    }
  }
}
