pipeline {
	agent any 
	stages {
		stage('build'){
			steps{
				sh "mvn clean package"
				sh "docker build . -t  tomapp:${env.BUILD_NUMBER}"
			}
		}
		stage('Docker build image && push'){
			steps{
				sh "docker login -u bskreddy18 -p bskreddy18"
				sh "docker push docker.io/bskreddy18/tomapp:${env.BUILD_NUMBER}"
			}
		}
		stage('deploy to kuberneters'){
			steps{
				echo "need to setup"
			}
		}
	}
}
