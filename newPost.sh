if [ -z $1 ]; then
        echo "Please provide a valid base filename. .md will be added as a suffix. Exiting..."
        exit 1
fi
cp src/data/blog-posts/template.0md src/data/blog-posts/$1.md
