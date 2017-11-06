file="../simple.dependencies"
cd ./Modules
while IFS= read line
do
  read name repo <<< "$line"
  cd $name
  echo ""
  echo "$name:"
  git status
  cd ..
done <"$file"

echo ""
echo "simple.deps:"
cd ../simple.deps
git status
cd ..

echo ""
echo "Base:"
git status

