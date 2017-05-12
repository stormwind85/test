port=$(wget --no-check-certificate --user=IoNiStEr --password=0cHyDZta -qO- https://docker-knock-auth.hipay.org/KyP54YzX/?srvname=deploy.hipay-pos-platform.com)

echo $port

sshpass -p Helpdesk16 ssh root@docker-knock-auth.hipay.org -p $port curl --user admin:15f07582ebcb4a39b50a4cadbc21e51c -s http://jenkins.hipay-pos-platform.com:8080/job/Repo_test/build?token=tokenRepoTest&cause=Une+cause+quelconque