require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'

# Give pretty output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new