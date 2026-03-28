require "simplecov"
require "simplecov-console"

SimpleCov.formatter = SimpleCov::Formatter::Console
SimpleCov::Formatter::Console.show_covered = true
SimpleCov.start do
  add_filter "/test_/"
  enable_coverage :branch
end

require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new], ENV, Minitest.backtrace_filter
