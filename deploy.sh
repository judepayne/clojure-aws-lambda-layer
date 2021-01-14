#!/bin/sh

# exit on any error
set -e

file=clojure-layer

# build an uberjar using depstar
clj -X:uberjar :jar java/lib/$file.jar :compile-ns :all


# Generate a zip file
zip -r -X  $file.zip java/

# publish the new lambda layer version. arn in lambdalayer.json
aws lambda publish-layer-version \
--layer-name Clojure-1-10-1 \
--description "Clojure 1.10.1 lambda layer" \
--compatible-runtimes java8 \
--zip-file fileb://$file.zip \
> LambdaLayerResult.json
