file="../simple.dependencies"
cd ./Modules
while IFS= read line
do
  read name repo <<< "$line"
  cd $name
  echo ""
  echo "$name:"
  git status -s
  cd ..
done <"$file"

echo ""
echo "simple.deps:"
cd ../simple.deps
git status -s
cd ..

if [ -d "../.git" ]; then
    echo ""
    echo "Base:"
    git status -s
fi

