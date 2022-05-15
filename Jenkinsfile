pipeline {
    agent {
        kubernetes {
            yaml '''
                spec:
                containers:
                - name: jnlp
                  image: jenkins/jnlp-slave
                  imagePullPolicy: IfNotPresent
                  tty: true
                  securityContext:
                  privileged: true
                - name: dind
                  image: docker:dind
                  imagePullPolicy: Always
                  securityContext:
                  privileged: true
                - name: helm
                  image: alpine/helm
                  tty: true
                  command:
                  - /bin/cat
                  securityContext:
                  privileged: true
                '''
        }
    }
    stages {
        stage('Build_and_push') {
            steps {
                container('dind') {
                    echo "-----docker hub login-----"
//                     withCredentials([usernamePassword(credentialsId: 'dockerhublogin', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
//                         docker login -u $USERNAME -p $PASSWORD
//                     }
//                     sh 'echo ${BUILD_NUMBER}'
                    sh 'echo $?'
                    echo "-----building image-----"
//                     dir ('') {
//                         sh 'docker build -t timofii/angular-app:jnkns . '
//                     }
                    echo "-----pushing image-----"
//                         sh 'docker push timofii/angular-app:jnkns'
                }
            }
        }
    }
}
