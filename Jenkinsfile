node("master") {
    stage('Checkout') {
    	checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/stormwind85/test/']]])
    }

    stage('Docker test') {
	    dockerNode(image: 'test_web', sideContainers: ['test_web']) {
			echo 'bien'
			pwd()
			sh 'pwd'
			sh 'ls -al'
		}
    }
}