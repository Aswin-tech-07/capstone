pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5')) // Keeps only the last 5 builds
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerkey') // Docker Hub credentials
  }
  stages {
    stage("Git Checkout"){           
      steps {                
        git branch: 'dev', credentialsId: 'github', url: 'https://github.com/Aswin-tech-07/capstone.git'
        echo 'Git Checkout Completed'            
      }        
    }
    stage('Build') {
      steps {
        sh 'docker build -t aswin3498/capstone_development:latest .'
        echo 'Docker build completed'
      }
    }
    stage('Login') {
      steps {
        sh 'echo ${DOCKERHUB_CREDENTIALS_PSW} | docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin'
        echo 'Docker logged in'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push aswin3498/capstone_development:latest'
        echo 'Docker image published'
      }
    }
  }
  post {
    always {
      // Ensure the sh commands are executed within a node or agent context
      script {
        sh 'docker logout'
        echo 'Docker logged out'
      }
    }
  }
}
