pipeline {
	agent any 
	stages {
		stage('build'){
			steps{
				sh "mvn clean package"
				sh "docker build . -t  ${ENV}"
			}
		}
		stage('Docker build image && push'){
			steps{
				sh "docker login -u bskreddy18 -p ${DOCKER_HUB}"
				sh "docker push ${ENV}:latest"
			}
		}
		stage('deploy to kuberneters'){
			steps{
				echo "need to setup"
			}
		}
	}
}
