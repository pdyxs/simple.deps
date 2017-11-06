if [ $1="deps" ]; then
    cd simple.deps
    git add *
    git commit -m "$2"
    git push origin master
elif [ -d "./Modules/$1" ]; then
    cd ./Modules/$1
    git add *
    git commit -m "$2"
    git push origin master
fi
