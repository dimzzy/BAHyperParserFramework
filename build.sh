#!/bin/bash

function failed()
{
  echo "Failed $*: $@" >&2
  exit 1
}

export OUTPUT=$WORKSPACE/output
rm -rf $OUTPUT
mkdir -p $OUTPUT

/Developer/usr/bin/xcodebuild -target BAHyperParser -configuration Release build || failed build;

cd $WORKSPACE/build/Release-iphoneuniversal || failed output;
rm BAHyperParser
zip -r -y -9 $OUTPUT/BAHyperParser.framework.zip BAHyperParser.framework
