file="../simple.dependencies"

cd ./simple.deps
git pull origin master
cd ..

cd ./Modules
while IFS= read line
do
  read name repo <<< "$line"
  if [ -d "$name" ]; then
    cd $name
    git pull origin master
    cd ..
  else
    if [ -d "../../.git" ]; then
      git submodule add $repo $name
    else
      git clone $repo $name
    fi
  fi
done <"$file"
