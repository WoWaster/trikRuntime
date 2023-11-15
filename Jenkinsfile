pipeline {
    agent {
        docker { image 'debian:sid' }
    }

    stages {
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
