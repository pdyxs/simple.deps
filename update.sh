CDIR=$PWD
REPOS=()
file="../simple.dependencies"

REPOS+=("./simple.deps")

cd ./Modules
while IFS= read line
do
  read name repo <<< "$line"
  if [ -d "$name" ]; then
      REPOS+=("./Modules/$name")
  else
    if [ -d "../../.git" ]; then
      git submodule add $repo $name
    else
      git clone $repo $name
    fi
  fi
done <"$file"

cd $CDIR
for repo in ${REPOS[@]}; do
    cd $repo
    git fetch
    [ $(git rev-parse HEAD) = $(git ls-remote $(git rev-parse --abbrev-ref @{u} | \
        sed 's/\// /g') | cut -f1) ] && echo up to date || git pull origin master
    cd $CDIR
done
