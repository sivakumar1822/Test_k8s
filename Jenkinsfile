pipeline {
	agent any 
	stages {
		stage('build'){
			steps{
				sh "mvn clean package"
				sh "docker build . -t  tomapp"
			}
		}
		stage('Docker build image && push'){
			steps{
				sh "docker login -u bskreddy18 -p bskreddy18"
				sh "docker tag tomapp:latest tomapp-dockerhub"
				sh "docker push docker.io/bskreddy18/tomapp/dockerhub"
			}
		}
		stage('deploy to kuberneters'){
			steps{
				echo "need to setup"
			}
		}
	}
}
