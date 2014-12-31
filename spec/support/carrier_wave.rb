require "carrierwave/test/matchers"

Dir[Rails.root.join("app/uploaders/**/*.rb")].each { |f| require f }

CARRIER_WAVE_UPLOADS = "#{Rails.root}/spec/support/uploads"

CarrierWave::Uploader::Base.descendants.each do |klass|
  next if klass.anonymous?

  klass.class_eval do
    def cache_dir
      "#{CARRIER_WAVE_UPLOADS}/tmp"
    end

    def store_dir
      "#{CARRIER_WAVE_UPLOADS}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
  end
end

RSpec.configure do |config|
  config.after(:all) do
    FileUtils.rm_rf(Dir[CARRIER_WAVE_UPLOADS])
  end
end
