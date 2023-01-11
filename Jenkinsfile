pipeline {
    agent any
  
     //create dockerhub credential in github with your dockerhub Username and Password/Token
    environment {
      DOCKERHUB_CREDENTIALS=credentials('dockerhub')
    }
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/adeoyedewale/ProjectReview2.git'
            }
        }
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('Dockerize') {
            steps {
                sh "docker build -t eruobodo/backendapp:${BUILD_NUMBER} ."
            }
        }
        //stage('Publish') {
        //    steps {
         //       sh "docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD"
         //       sh "docker tag your-nodejs-app $DOCKER_USERNAME/your-nodejs-app:$BUILD_NUMBER"
         //       sh "docker push $DOCKER_USERNAME/your-nodejs-app:$BUILD_NUMBER"
            //}
        stage('Login') {
		
              steps {
                 sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login --username eruobodo --password-stdin'    
              }
		    }

        stage('Push') {

              steps {
                 sh 'docker push eruobodo/backendapp:${BUILD_NUMBER}'
              }
        }
	    //stage('Deploy'){
		    //steps {
		//	    sh 'npm start'
		  //  }
	    //}
		}
	
    post {
        always {
		cleanWs()
      		sh 'docker logout'
        }
   }
}
