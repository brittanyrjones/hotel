require 'simplecov'
SimpleCov.start

gem 'minitest', '>= 5.0.0'
require 'minitest/pride'
require 'minitest/autorun'
require 'minitest/reporters'

require_relative '../lib/hotel'
require_relative '../lib/reservation'



Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
