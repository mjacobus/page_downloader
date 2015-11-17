$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

def setup_simplecov
  require "simplecov"

  SimpleCov.start do
    add_filter "/test/"
    add_group "Repository", "lib/koine/repository/repository"
    add_group "Persistency", "lib/koine/repository/persistence"
  end
end

if ENV["COVERALLS"]
  require "coveralls"
  Coveralls.wear!

  setup_simplecov
end

if ENV["COVERAGE"]
  setup_simplecov
end

if ENV["SCRUTINIZER"]
  require "scrutinizer/ocular"
  Scrutinizer::Ocular.watch!
  setup_simplecov
end

require "page_downloader"

require "minitest/autorun"
require "mocha/mini_test"

FIXTURE_PATH = File.expand_path("../fixtures", __FILE__)
