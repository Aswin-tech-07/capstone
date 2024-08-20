pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5')) // Keeps only the last 5 builds
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('docker') // Docker Hub credentials
  }
  stages {
    stage("Git Checkout"){           
      steps {                
        git branch: 'main', credentialsId: 'github', url: 'https://github.com/Aswin-tech-07/capstone.git'
        echo 'Git Checkout Completed'            
      }        
    }
    stage('Build') {
      steps {
        sh 'docker build -t aswin3498/capstone_production:latest .'
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
        sh 'docker push aswin3498/capstone_production:latest'
        echo 'Docker image published'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
      echo 'Docker logged out'
    }
  }
}
