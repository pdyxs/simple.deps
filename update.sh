file="../simple.dependencies"
cd ./Modules
while IFS= read line
do
  read name repo <<< "$line"
  if [ -d "$name" ]; then
    cd $name
    git pull origin master
    cd ..
  else
    git clone $repo
  fi
done <"$file"
