$:.unshift File.join(File.dirname(__FILE__), 'lib')
require 'aws-iam-authenticator-rb/version'

Gem::Specification.new do |s|
  s.name     = 'aws-iam-authenticator-rb'
  s.version  = ::AwsIamAuthenticatorRb::VERSION
  s.authors  = ['Cameron Dutro']
  s.email    = ['camertron@gmail.com']
  s.homepage = 'http://github.com/getkuby/aws-iam-authenticator-rb'
  s.license  = 'Apache-2.0'

  s.description = s.summary = 'AWS IAM Authenticator distributed as a Rubygem.'

  s.platform = Gem::Platform::RUBY

  s.require_path = 'lib'
  s.files = Dir['{lib,spec,vendor}/**/*', 'Gemfile', 'LICENSE', 'CHANGELOG.md', 'README.md', 'Rakefile', 'aws-iam-authenticator-rb.gemspec']
end
