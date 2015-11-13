require "test_helper"

class RemoteContentFetcherTest < Minitest::Test
  def test_can_download_content
    assert PageDownloader::RemoteContentFetcher.new.respond_to?(:fetch)
  end
end
