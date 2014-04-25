require 'nokogiri'
require 'open-uri'

module Scrapers
  class FrontPage

    # Structure of the front page
    #{
    #  '#content' =>
    #    {
    #      '#summary .overview' => {
    #         'hgroup' => {
    #           'a' => 'href',
    #           'a > h2.fn' => 'title',
    #           'h3 > a' => 'by'
    #         },
    #         'a span.price' => 'content'
    #      },
    #      'a > img.photo' => ['src', 'alt']
    #    }
    #}

    def scrape
      front_page_node = Nodes::FrontPage.new(doc)

      ::DailyOffer.find_or_create(front_page_node.to_hash)
    end

    def url
      'http://shirt.woot.com/'
    end

    def doc
      @doc ||= Nokogiri::HTML(open(url))
    end
  end
end
