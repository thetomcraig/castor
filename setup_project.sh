pwd=$PWD

sleep 1s
echo "STARTING NEW PROJECT"
echo "Github will be opened; do these things:"
echo "  Create the New Repo"
echo "  Name it"
echo "  Copy the SSH Key"
echo "Ready? [y\N]"
read answer
if [ "$answer" == "y" ]
then
  open https://github.com/new
fi

echo "Paste the SSH Key here"
read key 
git push --mirror $key

cd ..
git clone $key
project_name="tmux-project-manager"
cd $project_name
mv template_readme.md README.md
git add .
git commit -m 'Add Readme for $project_name'
git push

echo "Remove Template Dir? [y\N]"
read answer
if [ "$answer" == "y" ]
then
  rm -rf $pwd
fi
echo "DONE"
echo "NEW PROJECT EXISTS HERE: $PWD/$name"
