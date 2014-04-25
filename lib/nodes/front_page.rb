module Nodes
  class FrontPage

    def initialize(doc)
      @doc = doc
      @summary_node = doc.css('div#summary .overview').first
      header_node = @summary_node.children.at_css('hgroup')

      @link_node = header_node.children.at_css('a')
      @author_node = header_node.children.at_css('h3 a')

    end

    def to_hash
      {
        title: title,
        image_path: image_link,
        offer_link: offer_link,
        price: price,
        author: { name: author, catalog_link: author_catalog_link }
      }
    end

    private

    def offer_link
      @link_node.attr('href')
    end

    def title
      @link_node.children.at_css('h2.fn').content
    end

    def author
      @author_node.content
    end

    def author_catalog_link
      @author_node.attr('href')
    end

    def price
      @summary_node.children.at('span.price').content
    end

    def image_link
      image_node = @doc.css('#content #todays-deal a > img.photo')
      image_link = image_node.attr('src').value
    end

  end
end
