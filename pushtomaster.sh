echo "Doing Git Add..\n"
git add .
echo "Commiting..\n"
git commit -m "$(curl --silent http://whatthecommit.com/index.txt)"
echo "Pushing..\n"
git push -u origin master
