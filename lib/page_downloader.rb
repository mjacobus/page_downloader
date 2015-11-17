require "page_downloader/version"
require "page_downloader/filters"
require "page_downloader/filters/to_document_object"
require "page_downloader/filters/document_object_to_string"
require "page_downloader/filters/embed_script"
require "page_downloader/filters/embed_style"
require "page_downloader/remote_content_fetcher"
require "page_downloader/url_resolver"

class PageDownloader
  attr_reader :page, :fetcher, :filters

  def initialize(page, options = {})
    @page = page
    @fetcher = options.fetch(:fetcher, RemoteContentFetcher.new)
    @filters = options[:filters]

    unless @filters
      resolver = UrlResolver.new(referer: page)
      options =  { fetcher: fetcher, url_resolver: resolver }

      @filters ||= Filters.new [
        Filters::ToDocumentObject.new,
        Filters::EmbedScript.new(options),
        Filters::EmbedStyle.new(options),
        Filters::DocumentObjectToString.new,
      ]
    end
  end

  def to_file(destination)
    content = filters.filter(fetcher.fetch(page))

    File.open(destination, "w") do |f|
      f.puts(content)
    end
  end
end
