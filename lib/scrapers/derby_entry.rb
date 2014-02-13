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

    def self.find_or_create(entry_node, derby_id)
      derby_entry = Nodes::DerbyEntry.new(entry_node.at('.voteBlock'))

      if derby_entry.valid?
        find(derby_entry.entry_id) || create({ derby_id: derby_id }.merge(derby_entry.to_hash))
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
