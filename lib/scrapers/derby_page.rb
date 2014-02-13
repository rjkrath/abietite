require 'nokogiri'
require 'open-uri'

module Scrapers
  class DerbyPage

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

    def scrape
      derby_page_node = Nodes::DerbyPage.new(derby_page_links, status_node)

      if derby_page_node.valid?
        derby_obj = find_or_create(derby_page_node)

        primary_content_entries.each do |entry_node|
          DerbyEntry.find_or_create(entry_node, derby_obj.derby_id)
        end
      end
    end

    private

    def find_or_create(derby_page_node)
      find(derby_page_node.derby_id) || create(derby_page_node.to_hash)
    end

    def find(derby_id)
      ::Derby.where(derby_id: derby_id).first
    end

    def create(node_hash)
      ::Derby.create(node_hash)
    end

    def primary_content_entries
      doc.css('div.derbyPrimaryContent .entries .derby-entry')
    end

    def derby_page_links
      doc.css('nav#breadcrumbs ol li a')
    end

    def status_node
      doc.css('div#content div.derbyPrimaryContent > h1').first
    end

    def url
      'http://shirt.woot.com/derby'
    end

    def doc
      @doc ||= Nokogiri::HTML(open(url))
    end
  end
end
