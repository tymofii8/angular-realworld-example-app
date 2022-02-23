pipeline {
    agent {
        kubernetes {
            label 'front-${UUID.randomUUID().toString()}'
            yaml """
spec:
  containers:
  - name: jnlp
    image: jenkins/jnlp-slave:4.3-9
    imagePullPolicy: IfNotPresent
    tty: true
    securityContext:
      privileged: true
  - name: dind
    image: docker:dind
    imagePullPolicy: Always
    command:
      - dockerd
      - --host=unix:///var/run/docker.sock
      - --host=tcp://0.0.0.0:2375
      - --storage-driver=overlay
    securityContext:
      privileged: true
//   - name: helm
//     image: alpine/helm:3.8.0
//     tty: true
//     command:
//     - /bin/cat
//     securityContext:
//       privileged: true

"""
    }
  }
    environment { 
        registry = "timofii/front" 
        registryCredential = 'dockerhub_id' 
        dockerImage = '' 
    }
    stages {
        stage('docker build') { 
            steps {
              container ('dind'){
                script {
                    git 'https://github.com/tymofii8/angular-realworld-example-app.git'
                    ls -la
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                 }
              }
            }
         }
    }
}
