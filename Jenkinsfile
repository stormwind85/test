node("master") {
    stage('CheckoutMaster') {
    	checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/stormwind85/test/']]])
    }
    stage('Delete containers & images') {
        sh 'docker-compose stop; docker-compose rm -vf'
    }
    stage('Docker master') {
		sh 'docker-compose up --build -d'
    }
    stage('Switch to Develop') {
        deleteDir()
        sleep 2
    }
    stage('CheckoutDevelop') {
    	checkout([$class: 'GitSCM', branches: [[name: '*/develop']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/stormwind85/test/']]])
    }
    stage('Docker develop') {
		sh 'docker-compose up --build -d'
    }
}