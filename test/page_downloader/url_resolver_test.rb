require "test_helper"

class UrlResolverTest < Minitest::Test
  def test_resolves_base_url
    assert_equal "http://foo.com",
      UrlResolver.new(referer: "http://foo.com/sub/page.html").base_url

    assert_equal "http://foo.com",
      UrlResolver.new(referer: "http://foo.com").base_url

    assert_equal "https://foo.com",
      UrlResolver.new(referer: "https://foo.com").base_url
  end

  def test_resolve_valid_urls
    assert_resolved_url(
      "http://foo.com/css/foo.css",
      "http://foo.com/css/foo.css"
    )
  end

  def test_resolve_slash_based_urls
    assert_resolved_url(
      "http://foo.com/css/foo.css",
      "/css/foo.css",
    )
  end

  def test_resolves_double_slash_based_urls
    assert_resolved_url(
      "http://google.com/css/foo.css",
      "//google.com/css/foo.css",
    )
  end

  def test_resolves_non_prefixed_urls
    skip "figure out how to do this later"

    assert_resolved_url(
      "http://foo.com/sub/page.html/foo.css",
      "foo.css",
    )

    assert_resolved_url(
      "http://foo.com/sub/foo.css",
      "../foo.css",
    )
  end

  def test_raises_error_when_no_valid_url_is_given
    skip "is there really an invalid url format?"

    assert_raises UnrecognizedUrl do
      resolver.resolve(invalid_url)
    end
  end

  private

  def assert_resolved_url(expected, input_url)
    assert_equal expected, resolver.resolve(input_url)
  end

  def resolver
    @resolver ||= UrlResolver.new(referer: "http://foo.com/sub/page.html")
  end
end
