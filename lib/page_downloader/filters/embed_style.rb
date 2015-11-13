class PageDownloader
  class Filters
    class EmbedStyle < EmbedScript
      def filter(content)
        content.css("link").select do |link|
          stylesheet?(link)
        end.each do |link|
          embed(link)
        end

        content
      end

      private

      def stylesheet?(link)
        rel = link.attributes["rel"]
        rel && rel.value.downcase == "stylesheet"
      end

      def embed(link)
        content = fetch_content(link.attributes["href"].value)
        html = "<style>#{content}</style>"
        link.parent.add_child(html)
        link.remove
      end
    end
  end
end
