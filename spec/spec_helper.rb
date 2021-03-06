require 'coveralls'
require 'simplecov'
require_relative 'web_helper'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

SimpleCov.start

require 'rspec'
require 'byebug'
require 'capybara'
require 'capybara/rspec'


ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = Contest

RSpec.configure do |config|
  config.include Capybara::DSL
  config.color= true
  config.formatter= :documentation

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end
