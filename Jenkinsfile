pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile.debianSid'
        }
    }

    options {
        // This is required if you want to clean before build
        skipDefaultCheckout(true)
    }

    stages {
        stage('Preparation') {
            steps {
                 // Clean before build
                cleanWs()
                // We need to explicitly checkout from SCM here
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh 'mkdir build'
                sh 'cd build'
                sh 'qmake CONFIG+=release CONFIG+=tests CONFIG+=noPch CONFIG+=ccache CONFIG+=trik_nopython ..'
                sh 'make -j $(nproc) qmake_all'
                sh 'make -j $(nproc) all'
            }
        }
        stage('Test') {
            steps {
                sh 'make -k check TESTARGS="-platform offscreen"'
            }
        }
    }
}
