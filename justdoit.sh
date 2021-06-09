echo "Doing Git Add..\n"
git add .
echo "Commiting..\n"
git commit -m "$(curl http://whatthecommit.com/index.txt)" || echo "Cant fetch.."; git commit -m "$(shuf -n 1 lazy.txt)"
echo "Pushing..\n"
git push -u origin master
