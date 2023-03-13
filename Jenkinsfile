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
                  sh 'docker build -t xyz_technologies:latest .'
               }
        }


        stage('Clean') {
            steps {
                sh "docker image rm -f XYZtechnologies:latest"
                sh "docker system prune -f"
                
            }
        }


      }

  
}
