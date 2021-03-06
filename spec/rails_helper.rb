ENV["RAILS_ENV"] ||= "test"

require "spec_helper"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"
require "capybara/rails"
require "capybara/rspec"
require "cancan/matchers"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

Capybara.configure do |config|
  config.match = :prefer_exact
end

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.disable_monkey_patching!
  config.infer_base_class_for_anonymous_controllers = false
  config.backtrace_exclusion_patterns << /gems/
  config.order = "random"
  config.include FactoryGirl::Syntax::Methods
  config.include FeatureHelpers, :type => :feature
end

def support_file(file_name)
  File.expand_path("spec/support/files/#{file_name}")
end
