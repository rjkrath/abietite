require 'nokogiri'

class Scrapers::DerbyPage
  include Scrapers::Document

  # Structure of the derby page
  #{
  #  'div.derbyPrimaryContent' => {
  #    'div.entries' => { 'div.derby-entry' => 'see Scrapers::DerbyEntry' }
  #  }
  #}

  def scrape
    primary_content_entries.each do |entry_node|
      DerbyEntry.find_or_create(entry_node)
    end
  end

  def primary_content_entries
    doc.css('div.derbyPrimaryContent .entries .derby-entry')
  end

  def url
    '/derby'
  end

end