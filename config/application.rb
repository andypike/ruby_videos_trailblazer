require File.expand_path("../boot", __FILE__)

require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module RubyVideos
  class Application < Rails::Application
    config.autoload_paths << Rails.root.join("lib")
    config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/
  end
end
