
rm -rf src/images/*
rm -rf src/posts/*.mdx
rm -rf src/posts/src
rm -rf static/*

if [ $# -ne 0 ]; then 

    POSTNAME="$1"
    POST="src/posts/$POSTNAME.mdx"


    touch $POST
    echo "---" >> $POST
    echo "title: $POSTNAME" >> $POST
    echo "subtitle: This is a subtitle." >> $POST
    echo "summary: This is a little summary of the article." >> $POST
    echo "date: \"$(date -u +"%Y-%m-%dT%H:%M:%SZ")\"" >> $POST
    echo "tags: []" >> $POST
    echo "slug: /stories/$POSTNAME/" >> $POST
    echo "featuredImage: ../../images/$POSTNAME/banner.jpg" >> $POST
    echo "---" >> $POST
    echo "\n## Good luck writing." >> $POST

    curl -o src/images/banner.jpg "https://images.unsplash.com/photo-1630858084519-d822519de5a5?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=1112&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYzMTEzMTQ5MQ&ixlib=rb-1.2.1&q=80&w=1864"
fi