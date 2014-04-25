module Nodes
  class DerbyPage

    def initialize(link_nodes, status_node)
      @link_node = link_nodes.detect{ |link| link.content =~ /Derby #/ }
      @status_node = status_node
    end

    def derby_id
      @link_node.content.slice(link_regexp, 'id')
    end

    def to_hash
      {
        derby_id: derby_id,
        title: title,
        begin_at: Date.today,
        end_at: Date.today
      }
    end

    def valid?
      derby_id.present?
    end

    private

    def title
      @link_node.content.slice(link_regexp, 'title')
    end

    def link
      @link_node.attr('href')
    end

    def status
      @status_node.content
    end

    def link_regexp
      /Derby #(?<id>\d+): (?<title>.+)/
    end
  end
end
