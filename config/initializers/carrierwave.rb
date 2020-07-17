if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'                        # required
    config.fog_public = false
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     ENV["AWS_ACCESS_KEY"],        # required
      aws_secret_access_key: ENV["AWS_SECRET_KEY"],        # required
    }
    config.fog_directory  = ENV["AWS_BUCKET"]              # required
  end
end

if Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'                        # required
    config.fog_public = false
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     ENV["DEV_AWS_ACCESS_KEY"],        # required
      aws_secret_access_key: ENV["DEV_AWS_SECRET_KEY"],        # required
    }
    config.fog_directory  = ENV["DEV_AWS_BUCKET"]              # required
  end
end