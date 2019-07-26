pipeline {
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git(url: 'https://github.com/adminstudio/team-agent-n-bn.git', branch: 'master')
      }
    }
    stage('Building image') {
      parallel {
        stage('Building image') {
          steps {
            sh 'dockerImage = docker.build registry + ":$BUILD_NUMBER"'
          }
        }
        
    stage('Deploy Image') {
      steps {
        sh '''docker.withRegistry( \'\', registryCredential ) {
            dockerImage.push()
          }'''
        }
      }
      stage('Remove Unused docker image') {
        steps {
          sh 'docker rmi $registry:$BUILD_NUMBER'
        }
      }
      
    environment {
      registry = 'studioone/team-front'
      registryCredential = 'dockerhub'
    }
  }
