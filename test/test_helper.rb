require 'test/unit'
require 'rubygems'
require 'ruby-debug'
require 'mocha'

ENV["RAILS_ENV"] = "test"
RAILS_ROOT = "anywhere"

gem 'rails', ENV['RAILS_GEM'] if ENV['RAILS_GEM']

require 'active_support'
require 'action_controller'
require 'action_controller/test_case'
require 'action_controller/test_process'

# Boot rails
require 'initializer'

I18n.load_path << File.join(File.dirname(__FILE__), 'locales', 'en.yml')
I18n.reload!

class ApplicationController < ActionController::Base; end

# Add IR to load path and load the main file
ActiveSupport::Dependencies.load_paths << File.expand_path(File.dirname(__FILE__) + '/../lib')
require_dependency 'inherited_resources'

ActionController::Base.view_paths = File.join(File.dirname(__FILE__), 'views')

ActionController::Routing::Routes.draw do |map|
  map.connect ':controller/:action/:id'
end
