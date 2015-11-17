class UrlResolver
  def initialize(options = {})
    @options = options
  end

  def resolve(given_url)
    normal_url(given_url) ||
      url_for_double_dashed(given_url) ||
      slash_based_url(given_url) ||
      non_prefixed_url(given_url) ||
      given_url
  end

  def base_url
    @base_url ||= base_url_for(referer)
  end

  private

  def referer
    @referer ||= @options.fetch(:referer)
  end

  def base_url_for(url)
    matches = url.match(%r{^(http(s)?://[^/]+)})
    return matches[1] if matches
  end

  def url_for_double_dashed(url)
    if url.match(%r{^//[\w]+})
      "http:#{url}"
    end
  end

  def slash_based_url(url)
    if url.match(%r{^/[\w]+})
      "#{base_url}#{url}"
    end
  end

  def normal_url(url)
    is_url = base_url_for(url)
    url if is_url
  end

  def non_prefixed_url(url)
    expanded = File.expand_path(url, referer)
    expanded = expanded.split("http")
    expanded.shift
    expanded.unshift("").join("http")
  end
end
