class PageDownloader
  class Filters
    class EmbedScript
      attr_reader :fetcher

      def initialize(options = {})
        @fetcher = options.fetch :fetcher
        @url_resolver = options.fetch :url_resolver
      end

      def filter(content)
        content.css("script").select do |script|
          script.attributes["src"]
        end.each do |script|
          embed(script)
        end

        content
      end

      private

      def embed(script)
        html = fetch_content(script.attributes["src"].value)
        script.remove_attribute("src")
        script.add_child(html)
      end

      def fetch_content(url)
        fetcher.fetch(@url_resolver.resolve(url))
      end
    end
  end
end
