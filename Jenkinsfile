pipeline{
    agent { label 'root' }
      environment{
        IMAGE = "xyz_technologies:${env.BUILD_NUMBER}"
    }
    stages{
        
        stage("docker build")
        {
          steps{
                  sh 'docker build -t ${IMAGE} .'
               }
        }

         stage ('Deploy') {
            steps {
                script{
                    sh 'kubectl apply -f k8s/service.yml'
                    sh 'kubectl apply -f k8s/deployment.yml'
                   // sh "ansible-playbook  playbook.yml --extra-vars \"image_id=${IMAGE}\""
                }
            }
        }



        stage('Clean unsed k8s resources') {
            steps {
                sh "docker system prune -f"
                
            }
        }

    }

  
}
