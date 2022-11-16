set -e

TMP_DIR="./tmp/"

[ $PWD == "/scripts/" ] && cd ..;

INCLUDE_DIR="$PWD/include"

[ ! -d $TMP_DIR ] && mkdir $TMP_DIR
[ ! -d $INCLUDE_DIR ] && mkdir $INCLUDE_DIR

cd $TMP_DIR

git clone https://github.com/Just0x02/Alchemy ./

[ -d "$INCLUDE_DIR/alchemy" ] && rm -r "$INCLUDE_DIR/alchemy"
mv "./include/alchemy" "$INCLUDE_DIR/alchemy"

cd ..

rm -rf $TMP_DIR

echo "Done!"