require "test_helper"

class PageDownloaderTest < Minitest::Test

  def test_can_set_custom_filters
    filters = []
    downloader = PageDownloader.new(page, filters: filters)
    assert_same filters, downloader.filters
  end

  def test_has_default_fetcher
    fetcher = PageDownloader.new(page).fetcher
    assert_instance_of(PageDownloader::RemoteContentFetcher, fetcher)
  end

  def test_fetcher_can_be_overriden
    fetcher = stub
    downloader = PageDownloader.new(page, fetcher: fetcher)
    assert_same fetcher, downloader.fetcher
  end

  def test_can_set_page
    assert_equal page, downloader.page
  end

  def test_downloads_page_with_its_assests
    mock_response("http://example.com/page.html", "/page.html")
    mock_response("http://example.com/file.js", "/file.js")
    mock_response("http://example.com/file.css", "/file.css")
    expected_file_content = fixture("/page_expected.html")

    expected_file = "/tmp/file.html"
    system("rm -f #{expected_file}")

    downloader.to_file(expected_file)

    assert File.exist?(expected_file), "file #{expected_file} was not created"
    assert_same_html expected_file_content, File.read(expected_file)
  end

  private

  def downloader
    PageDownloader.new(page, fetcher: mock_fetcher)
  end

  def mock_fetcher
    @fetcher ||= mock("fetcher")
  end

  def mock_response(url, fixture_file)
    mock_fetcher.expects(:fetch).with(url).returns(fixture(fixture_file))
  end

  def fixture(file)
    File.read(FIXTURE_PATH + file)
  end

  def page
    "http://example.com/page.html"
  end

  def assert_same_html(expected, actual)
    expected = Nokogiri::HTML(expected)
    actual = Nokogiri::HTML(actual)
    assert_equal(expected.to_s, actual.to_s)
  end

  def refresh_content(html)
    child = html.children.last
    dup = child.dup
    child.remove
    html.add_child(dup)
  end
end
