pipeline {
    
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_KEY')
    }
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                git 'https://github.com/lakshmeprabha/git_terraform.git'
            }
        }
        stage('Terraform init') {
            steps {
                bat 'terraform init'
            }
        }
        stage('Terraform apply') {
            steps {
                bat 'terraform apply --auto-approve'
            }
        }
    }
}
