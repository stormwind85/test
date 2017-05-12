port=$(wget --no-check-certificate --user=$USER --password=$PASSWORD -qO- https://docker-knock-auth.hipay.org/KyP54YzX/?srvname=deploy.hipay-pos-platform.com)

sshpass -p $PASS_DEPLOY ssh root@docker-knock-auth.hipay.org -p $port curl --user admin:$PASS_JENKINS -s "http://jenkins.hipay-pos-platform.com:8080/job/Repo_test/build?token=${TOKEN}&cause=Une+cause+quelconque"