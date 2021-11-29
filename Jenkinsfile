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
				sh "docker tag tomapp:latest bskreddy18/my-repo/tomapp:latest"
				sh "docker push bskreddy18/my-repo/tomapp:latest"
			}
		}
		stage('deploy to kuberneters'){
			steps{
				echo "need to setup"
			}
		}
	}
}
