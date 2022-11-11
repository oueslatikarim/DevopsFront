pipeline {
    agent any
    
    environment { 
        registry = "oueslatikarim/front" 
        registryCredential = '' 
	
	dockerImage = '' 
    }		

    stages {
        stage('git clone front')
        {
            steps
            {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/oueslatikarim/DevopsFront']]])
            }
            
        }
        


         stage('building docker image')
        {
            steps
            {
                script
                {
                   // dockerImage=docker.build registry+":$BUILD_NUMBER"
                   sh 'docker build -t oueslatikarim/front .'
                }
            }
        }
   
        
        stage('image up')
        {
            steps{
                sh 'docker-compose up -d'
            }
        }
       
       
        
        
    }

    }
  
    


