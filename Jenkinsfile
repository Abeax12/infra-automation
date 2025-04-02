pipeline {
  agent any
  stages {
    stage('Provision VMs') {
      steps {
        dir('terraform') {
          sh 'terraform init && terraform apply -auto-approve'
        }
      }
    }
    stage('Configure Infrastructure') {
      steps {
        dir('ansible') {
          sh 'ansible-playbook -i inventory.yml playbooks/deploy-mail.yml'
          sh 'ansible-playbook -i inventory.yml playbooks/deploy-ad-dns.yml'
        }
      }
    }
  }
}