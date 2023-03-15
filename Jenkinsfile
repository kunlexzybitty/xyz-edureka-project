pipeline{
    agent { label 'Slave1' }
    stages{


       stage('Maven Compile') {
            steps {
                sh "mvn compile"
                
            }
        }    

         stage('Maven Test') {
            steps {
                sh "mvn test"
                
            }
        }    
         
        stage('Maven Build') {
            steps {
                sh "mvn clean package"
            }
        }
        
        stage("docker build")
        {
          steps{
                  sh 'docker build -t xyz_technologies:'+$BUILD_NUMBER+' .'
               }
        }

         stage ('Deploy') {
            steps {
                script{
                    def image_id = "xyz_technologies:$BUILD_NUMBER"
                    sh "ansible-playbook  playbook.yml --extra-vars \"image_id=${image_id}\""
                }
            }
        }


/*
        stage('Clean unsed k8s resources') {
            steps {
                sh "docker system prune -f"
                
            }
        }
*/

      }

  
}
