require 'nokogiri'
require 'open-uri'

module Document

  def doc
    @doc ||= Nokogiri::HTML(open(url))
  end
end
