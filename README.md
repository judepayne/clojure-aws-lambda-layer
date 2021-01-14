# clojure-aws-lambda-layer
An AWS Lambda Layer for Clojure 1.10.1

This lambda layer contains clojue 1.10.1 and clojure/data.json 1.0.0

Having a lambda layer that contains all the compiled classes for clojure and data.json means that any Clojure lambdas built on top of those can be extremely lightweight builds (i.e. thin jars). This means that the minimum amount of compiled code is deployed each time.

I use [depstar](https://github.com/seancorfield/depstar) to build Clojure projects. Please see the script `deploy.sh` to see how this lambda layer is built as an uberjar, zipped and deployed to AWS.
The zip file must have an internal structure like `java/lib/<myzipfile>.jar` as per the [AWS instructions](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html#configuration-layers-path).

Once you have a Clojure uberjar as a lambda layer available, then any lambdas you build do not need to be built as uberjars, but can be built as thin jars. The lambdas you build need to refer to this layer using the AWS ARN you obtain when deploying this layer using the last command in `deploy.sh`.

Of course, you can put any Clojure libraries that you want into a Clojure layer if you intend to use them across a range of AWS lambdas.
