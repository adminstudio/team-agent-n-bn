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
        stage('') {
          steps {
            slackSend(baseUrl: 'https://hooks.slack.com/services/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', channel: 'Devops', message: 'ERRRORRRR', sendAsText: true, token: 'xoxp-400027158563-399604058529-566013170739-5594da8f0d355748294c82776a85b535', username: 'jenkins')
          }
        }
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
      stage('Done') {
        steps {
          slackSend(token: 'xoxp-400027158563-399604058529-566013170739-5594da8f0d355748294c82776a85b535', channel: 'Devops', baseUrl: 'xoxp-400027158563-399604058529-566013170739-5594da8f0d355748294c82776a85b535', username: 'Jenkins', message: 'Done..Everything is good!!!')
        }
      }
    }
    environment {
      registry = 'studioone/team-agent-n-bn'
      registryCredential = 'dockerhub'
    }
  }