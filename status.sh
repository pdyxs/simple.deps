file="../simple.dependencies"
cd ./Modules
while IFS= read line
do
  read name repo <<< "$line"
  cd $name
  git status
  cd ..
done <"$file"
