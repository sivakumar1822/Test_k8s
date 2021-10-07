pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                // Get some code from a GitHub repository

                // Run Maven on a Unix agent.
                sh "mvn clean package"

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }

            post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test resultsof and archive the jar file add to new
                success {
                    archiveArtifacts 'target/*.war'
                }
            }
        }
          stage('docker build and Deploy') {
              steps {
                sh '''
                docker build -t multipipeline-master .
                docker run -itd -p 8084:8080 multipipeline-master
                '''
            }
         }
    }
}
