require 'nokogiri'
module Scrapers
  class DerbyEntry

    # Structure of Derby Entry
    #{ 'div.derby-entry' =>
    #  [
    #    {
    #      'div.voteBlock' => {
    #        See Nodes::DerbyEntry
    #      }
    #    }
    #  ]
    #}

    def self.find_or_create(entry_node)
      derby_entry = Nodes::DerbyEntry.new(entry_node.at('.voteBlock'))

      node_data = derby_entry.extract_data

      if node_data.present?
        find(node_data[:entry_id]) || create(node_data)
      end
    end

    private

    def self.create(node_hash)
      ::DerbyEntry.create(node_hash)
    end

    def self.find(entry_id)
      ::DerbyEntry.where(entry_id: entry_id).first
    end
  end
end
