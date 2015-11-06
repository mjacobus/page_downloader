require "test_helper"

class PageDownloaderTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::PageDownloader::VERSION
  end
end
