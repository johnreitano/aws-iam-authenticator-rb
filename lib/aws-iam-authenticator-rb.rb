module AwsIamAuthenticatorRb
  def self.executable
    @path ||= begin
      pattern = File.expand_path(File.join('..', 'vendor', 'aws-iam-authenticator*'), __dir__)
      Dir.glob(pattern).first
    end
  end
end
