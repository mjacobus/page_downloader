require "nokogiri"

class PageDownloader
  class Filters
    class ToDocumentObject
      def filter(content)
        Nokogiri::HTML(content)
      end
    end
  end
end
