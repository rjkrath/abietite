require 'nokogiri'
module Scrapers
  class DerbyEntry

    attr_reader :entry_id, :total_votes, :status, :entry_link, :entry_title, :img_path

    # Structure of Derby Entry
    #{ 'div.derby-entry' =>
    #  [
    #    {
    #      'div.voteBlock' => {
    #        'class' => 'status',
    #        'div.total' => 'span.innerHTML',
    #        'div#DerbyEntry_\d+' => 'Parse \d+ out <- id',
    #        'div.content' => {
    #          'a' => {
    #            'href' => '/derby/entry/\d*/.*',
    #            'img' => ['title', 'src'] }
    #        }
    #      }
    #    }
    #  ]
    #}

    def self.find_or_create(entry_node)
      node_data = extract_data(entry_node)

      find(node_data[:entry_id]) || create(node_data )
    end

    def extract_data(entry_node)
      node = entry_node.at('.voteBlock')

      {
        entry_id: entry_id(node),
        total_votes: total_votes(node),
        status: entry_status(node),
        entry_link: entry_link(node),
      }.merge(image_data(node))
    end

    private

    def self.create(node_hash)
      ::DerbyEntry.create(node_hash)
    end

    def self.find(entry_id)
      ::DerbyEntry.where(entry_id: entry_id).first
    end

    def entry_link(node)
      node.at('.content a').attr('href')
    end

    def entry_id(node)
      node.attr('id').slice(/\d+/)
    end

    def total_votes(node)
      node.at('.total span').content.slice(/\d+/)
    end

    def entry_status(node)
      node.attr('class').slice(/(active)|(rejected)/)
    end

    def image_data(node)
      content_img = node.at('.content img')
      {
        title: content_img.attr('title'),
        img_path: content_img.attr('src')
      }
    end
  end
end
