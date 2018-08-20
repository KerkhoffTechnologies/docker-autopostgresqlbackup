def dockerImage
def localTag = "qeye/docker-autopostgresqlbackup:${env.BRANCH_NAME}-${env.BUILD_ID}"
def gitlabTag = "${env.BRANCH_NAME}"  // Gitlab only gets branch tags

pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        checkout scm
        sh 'ls'
        script {
          dockerImage = docker.build(localTag, "--pull .")
        }
      }
    }
    stage('Test') {
      steps {
        script {
          dockerImage.inside('-u root') {
            // Make some temporary keys
            sh '/usr/bin/ssh-keygen -A'
            // Test configuration, using temp keys
            sh '/usr/sbin/sshd -td'
          }
        }
      }
    }
    stage('Push') {
      steps {
        script {
          docker.withRegistry('https://docker.kerkhofftech.ca', 'jenkins_gitlab_credentials') {
            dockerImage.push(gitlabTag)
          }
        }
      }
    }
  }
}
