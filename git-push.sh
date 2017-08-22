defaultPush='n'
git add .
git status
read -r -p "Please, write your commit message : " message
git commit -am "$message"
read -p "Are you sure to push your commit ? Default : [$defaultPush]" push
push=${push:-$defaultPush}
if [ '$push' = 'y' ]; then
	git push
fi