#!/usr/bin/env sh
base=$1
apiflow=$2

git pull
tag=$(git describe --abbrev=0 --tags)
mv ./releases/current/ ./releases/$tag
mkdir -p ./releases/current

cd $apiflow
make pack TARGET="curl"
cd $base

cp $apiflow/releases/paw/generators/CurlMarkdown* ./releases/current/
