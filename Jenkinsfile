pipeline {
	agent any 
	environment{
		DOCKER_TAG = getDockerTag()
	}
	stages {
		stage('build'){
			steps{
				sh "mvn clean package"
				sh "docker build . -t  bskreddy18/my-repo:${DOCKER_TAG}"
			}
		}
		stage('Docker build image && push'){
			steps{
				sh "docker login -u bskreddy18 -p ${DockerHub}"
				sh "docker push bskreddy18/my-repo:${DOCKER_TAG}"
			}
		}
		stage('deploy to kuberneters'){
			steps{
			  	sh "chmod x changeTag.sh"
				sh "./changeTag.sh ${DOCKER_TAG}"
				sshagent(['SSH_SKR_BASTION']) {
    				    sh "scp -o StrictHostKeyChecking=no services.yml tom-app-pod.yml ubuntu@13.235.78.160:/home/ubuntu"
				}
			}
		}
	}
}
