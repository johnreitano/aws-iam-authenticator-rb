## aws-iam-authenticator-rb

The [AWS IAM Authenticator](https://github.com/kubernetes-sigs/aws-iam-authenticator) distributed as a Rubygem.

## Intro

The AWS IAM Authenticator is "a tool to use AWS IAM credentials to authenticate to a Kubernetes cluster." It's generally used by `kubectl` (the Kubernetes CLI) to communicate with an Amazon [EKS](https://aws.amazon.com/eks/) cluster.

It's wrapped up as a Rubygem here to make it easy to distribute with Ruby apps, and was originally created for the [Kuby](https://github.com/getkuby/kuby-core) project.

## Usage

There is only one method that returns the absolute path to the aws-iam-authenticator executable:

```ruby
require 'aws-iam-authenticator-rb'

# /Users/me/.rbenv/versions/2.5.6/lib/ruby/gems/2.5.0/gems/aws-iam-authenticator-rb-0.1.0-x86_64-darwin/vendor/aws-iam-authenticator
AwsIamAuthenticatorRb.executable
```

The version of the authenticator can be obtained like so:

```ruby
require 'aws-iam-authenticator-rb/version'

# "0.5.0"
AwsIamAuthenticatorRb::AWS_IAM_AUTHENTICATOR_VERSION
```

## License

AWS IAM Authenticator is licensed under the Apache 2 license. The LICENSE file contains a copy.

## Authors

* Cameron C. Dutro: http://github.com/camertron
