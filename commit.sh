file="./simple.dependencies"
CDIR=${PWD}
REPOS=()

if [ $1 == "deps" ]; then
    REPOS+=("./simple.deps")
elif [ -d "./Plugins/$1" ]; then
    REPOS+=("./Plugins/$1")
elif [ $1 == "all" ]; then
    REPOS+=("./simple.deps")
    while IFS= read line
    do
        read name repo <<< "$line"
        REPOS+=("./Plugins/$name")
    done <"$file"
    if [ -d "../.git" ]; then
        REPOS+=("./")
    fi
fi

for repo in ${REPOS[@]}; do
    cd $repo
    if [[ `git status --porcelain` ]]; then
        git add --all
        git commit -m "$2"
        git push origin master
    fi

    cd $CDIR
done
