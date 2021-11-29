pipeline {
	agent any
	environment {
		DOCKER_PWD = credentials('DockerHub')
		
	}
	stages {
		stage('build'){
			steps{
				sh "mvn clean package"
				sh "docker build . -t  tomapp"
			}
		}
		stage('Docker build image && push'){
			steps{
				sh "docker login -u bskreddy18 -p ${DOCKER_PWD}"
				sh "docker tag tomapp:latest bskreddy18/my-repo:latest"
				sh "docker push bskreddy18/my-repo:latest"
			}
		}
		stage('deploy to kuberneters'){
			steps{
				sshagent(['SSH_SKR_BASTION']) {
    				sh "scp -o StrictHostKeyChecking=no services.yml deployment.yaml root@13.235.78.160:/root"
				}
			}
		}
	}
}
