require 'bundler/setup'
require 'rspec/core/rake_task'
require 'fileutils'

DISTRIBUTIONS = [
  { rb_platform: 'x86_64-darwin', filename: 'darwin_amd64' },
  { rb_platform: 'x86_64-linux',  filename: 'linux_amd64' },
  { rb_platform: 'x64-mswin64',   filename: 'windows_amd64.exe' }
]

task :build do
  require 'rubygems/package'
  require 'open-uri'
  require 'aws-iam-authenticator-rb/version'

  FileUtils.mkdir_p('pkg')

  DISTRIBUTIONS.each do |distro|
    FileUtils.rm_rf('vendor')
    FileUtils.mkdir('vendor')

    url = "https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v#{AwsIamAuthenticatorRb::AWS_IAM_AUTHENTICATOR_VERSION}/aws-iam-authenticator_#{AwsIamAuthenticatorRb::AWS_IAM_AUTHENTICATOR_VERSION}_#{distro[:filename]}"
    exe = "aws-iam-authenticator#{File.extname(distro[:filename])}"
    File.write(exe, open(url).read)
    system("chmod +x #{exe}")
    FileUtils.rm_rf('vendor')
    FileUtils.mkdir('vendor')
    FileUtils.cp(exe, 'vendor')

    gemspec = eval(File.read('aws-iam-authenticator-rb.gemspec'))
    gemspec.platform = distro[:rb_platform]
    package = Gem::Package.build(gemspec)
    FileUtils.mv(package, 'pkg')
  end
end

task :publish do
  require 'aws-iam-authenticator-rb/version'

  Dir.glob(File.join('pkg', "aws-iam-authenticator-rb-#{AwsIamAuthenticatorRb::VERSION}-*.gem")).each do |pkg|
    puts "Publishing #{pkg}"
    STDOUT.write("Enter OTP code: ")
    otp = STDIN.gets.strip
    system("gem push -k rubygems --otp #{otp} #{pkg}")
  end
end

task default: :spec

desc 'Run specs'
RSpec::Core::RakeTask.new do |t|
  t.pattern = './spec/**/*_spec.rb'
end
