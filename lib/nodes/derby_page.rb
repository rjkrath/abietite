module Nodes
  class DerbyPage

    def initialize(doc)
      @doc = doc
    end

    def derby_id
      link_node.content.slice(link_regexp, 'id')
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

    def link_node
      @link_node ||= @doc.css('nav#breadcrumbs ol li a').detect{ |link| link.content =~ /Derby #/ }
    end


    def title
      link_node.content.slice(link_regexp, 'title')
    end

    def link
      link_node.attr('href')
    end

    def status
      @doc.css('div#content div.derbyPrimaryContent > h1').first.content
    end

    def link_regexp
      /Derby #(?<id>\d+): (?<title>.+)/
    end
  end
end
