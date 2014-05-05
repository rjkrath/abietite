require 'nokogiri'
require 'open-uri'

module Scrapers
  class DerbyPage

    def initialize(url = nil, doc = nil)
      @url = url
      @doc = doc
    end

    # Structure of the derby page
    #{
    #  'nav#breadcrumbs' => {
    #    'ol li a' => ['href', 'content']
    #  },
    #
    #  'div.derbyPrimaryContent' => {
    #    'div.entries' => { 'div.derby-entry' => 'see Scrapers::DerbyEntry' }
    #  }
    #}
    def self.scrape_derby
      self.new.scrape
    end

    def scrape
      derby_page_node = Nodes::DerbyPage.new(doc)

      if derby_page_node.valid?
        derby_obj = find_or_create(derby_page_node)

        primary_content_entries.each do |entry_node|
          DerbyEntry.find_or_create(entry_node, derby_obj.id)
        end
      end
    end

    private

    def find_or_create(derby_page_node)
      find(derby_page_node.derby_id) || create(derby_page_node.to_hash)
    end

    def find(derby_id)
      ::Derby.find_by(derby_id: derby_id)
    end

    def create(node_hash)
      ::Derby.create(node_hash)
    end

    def primary_content_entries
      doc.css('div.derbyPrimaryContent .entries .derby-entry')
    end

    def url
      @url ||= 'http://shirt.woot.com/derby'
    end

    def doc
      @doc ||=  Nokogiri::HTML::Document.parse(open(url))
    end
  end
end
