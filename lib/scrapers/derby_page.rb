require 'nokogiri'

class Scrapers::DerbyPage

  # Structure of the derby page
  #{
  #  'div.derbyPrimaryContent' => {
  #    'div.entries' => { 'div.derby-entry' => 'see Scrapers::DerbyEntry' }
  #  }
  #}

  def initialize
    @url = '/derby'
  end

  def scrape
    primary_content_entries.each do |entry_node|
      DerbyEntry.new(entry_node).create_or_update
    end
  end

  def primary_content_entries
    []
  end

end