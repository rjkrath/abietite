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
      entry_node = Nodes::DerbyEntry.new(entry_node.at('.voteBlock'))

      if entry_node.valid?
        begin
          find_and_update(entry_node, derby_id) || create(entry_node, derby_id)
        rescue ActiveRecord::RecordInvalid => e
          puts "e: #{e.inspect} #{e.record.inspect}"
        end
      end
    end

    private

    def self.create(entry_node, derby_id)
      ::DerbyEntry.create!({ derby_id: derby_id }.merge(entry_node.to_hash))
    end

    def self.find_and_update(entry_node, derby_id)
      if (entry = ::DerbyEntry.find_by(entry_id: entry_node.entry_id, derby_id: derby_id)).present?
        entry.update!(vote_count: entry_node.vote_count)
      end
    end
  end
end
