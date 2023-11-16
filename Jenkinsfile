pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile.debianSid'
        }
    }

    stages {
        stage('Preparation') {
            steps {
                // Clean before build
                cleanWs(patterns: [[pattern: 'build', type: 'INCLUDE']], deleteDirs: true)
            }
        }
        stage('Build') {
            steps {
                sh 'mkdir build'
                dir('build') {
                    sh 'qmake -spec linux-clang CONFIG+=release CONFIG+=tests CONFIG+=noPch CONFIG+=ccache CONFIG+=trik_nopython ..'
                    sh 'make -j $(nproc) qmake_all'
                    sh 'make -j $(nproc) all'
                }
            }
        }
        stage('Test') {
            steps {
                dir('build') {
                    sh 'make -k check TESTARGS="-platform offscreen"'
                }
            }
        }
    }
}
