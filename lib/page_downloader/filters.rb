class PageDownloader
  class Filters
    attr_reader :filters

    def initialize(filters = [])
      @filters = filters
    end

    def filter(content)
      filters.each do |filter|
        content = filter.filter(content)
      end

      content
    end
  end
end
