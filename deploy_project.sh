user=IoNiStEr
password=0cHyDZta
passwordContainer=Helpdesk16
passwordJenkins=15f07582ebcb4a39b50a4cadbc21e51c

port=$(wget --no-check-certificate --user=$user --password=$password -qO- https://docker-knock-auth.hipay.org/KyP54YzX/?srvname=deploy.hipay-pos-platform.com)

echo $port

sshpass -p $passwordContainer ssh root@docker-knock-auth.hipay.org -p $port curl --user admin:$passwordJenkins http://jenkins.hipay-pos-platform.com:8080/job/Repo_test/build?token=tokenRepoTest&cause=Une+cause+quelconque