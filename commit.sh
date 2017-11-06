file="./simple.dependencies"
CDIR=${PWD}
REPOS=()

if [ $1="deps" ]; then
    REPOS+=("./simple.deps")
elif [ -d "./Modules/$1" ]; then
    REPOS+=("./Modules/$1")
elif [ $1="all" ]; then
    while IFS= read line
    do
        read name repo <<< "$line"
        echo $name
        REPOS+=("./Modules/$name")
    done <"$file"
    REPOS+=("./")
fi

for repo in ${REPOS[@]}; do
    echo $PWD
    echo $repo
    cd $repo
    git add --all
    git commit -m "$2"
    git push origin master
    cd $CDIR
done
