require "net/http"
require "addressable/uri"

class PageDownloader
  class RemoteContentFetcher
    def fetch(page_url)
      puts "Fetching: #{page_url}"
      url = Addressable::URI.parse(page_url)
      ssl = url.scheme == "https"

      Net::HTTP.start(url.host, url.port, use_ssl: ssl) do |http|
        request = Net::HTTP::Get.new(url)
        http.request(request).body
      end
    end
  end
end
