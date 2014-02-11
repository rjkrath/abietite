require 'nokogiri'
require 'open-uri'

module Scrapers
  module Document
    def doc
      @doc ||= Nokogiri::HTML(open(url))
    end
  end
end
