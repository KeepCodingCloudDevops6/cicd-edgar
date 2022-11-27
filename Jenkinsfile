pipeline {
    agent {
        label('terraform')
    }
    environment{
        AWS_ACCESS_KEY_ID = credentials('aws_secret_user')
        AWS_SECRET_ACCESS_KEY = credentials('aws_secret_pass') 
    }
    
    stages{
        stage('TFInit'){
            steps{
                dir('Terraform'){
                    sh 'terraform init'
                }
            }
        }
        
        stage('TFPlan'){
            steps{
                dir('Terraform'){
                    sh 'terraform plan'
                }
            }
        }
        
        stage('TFApply'){
            steps{
                dir('Terraform'){
                    sh 'terraform apply -auto-approve'
                }
            }
        }
        stage('TFInit-Prod') {
            steps {
                dir('Terraform') {
                    sh 'terraform init -backend-config="key=prod/terraform.tfstate"'
                }
            }
        }

        stage('TFPlan-Prod') {
            steps {
                dir('Terraform') {
                    sh 'terraform plan -var="bucket-name=acme-edgar"'
                }
            }
        }
        stage('TFApply-Prod') {
            steps {
                dir('Terraform') {
                    sh 'terraform apply -var="bucket-name=acme-edgar" -auto-approve'
                }
            }
        }
    }
}
