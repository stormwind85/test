node("master") {
    stage 'Checkout' {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/stormwind85/test/']]])
    }
    
    stage 'Docker test' {
        withDockerContainer('test_web') {
            // some block
        }
    }
}
