
# Vars
BASEDIR="src/posts"
BASEDIR_IMAGES="src/images"
BASEDIR_STATIC="static"
BASEDIR_BUCKET="gs://posts.farazshaikh.com"
BUNDLEDIR="bundle"


FILEPATH=$(ls $BASEDIR/*.mdx)
FILENAME=$(basename "$FILEPATH" | cut -f 1 -d '.')


# Bundle
echo "Bundling $FILENAME"
echo ""

mkdir -p "$BUNDLEDIR/$FILENAME"
mkdir -p "$BUNDLEDIR/$FILENAME/images"
cp $FILEPATH "$BUNDLEDIR/$FILENAME/$FILENAME.mdx"
cp -r "$BASEDIR/src" "$BUNDLEDIR/$FILENAME/src"
cp -r "$BASEDIR_IMAGES" "$BUNDLEDIR/$FILENAME"
cp -r "$BASEDIR_STATIC/$FILENAME" "$BUNDLEDIR/$FILENAME/static"


# Post
echo "Posting $FILENAME to GCP bucket $BASEDIR_BUCKET"
echo ""
gsutil cp -n -r "$BUNDLEDIR/$FILENAME" $BASEDIR_BUCKET