module Nodes
  class DerbyEntry

    # Derby Node Structure
    #{
    #  'class' => 'status',
    #  'div.total' => 'span.innerHTML',
    #  'div#DerbyEntry_\d+' => 'Parse \d+ out <- id',
    #  'div.content' => {
    #    'a' => {
    #      'href' => '/derby/entry/\d*/.*',
    #      'img' => ['title', 'src'] }
    #  }
    #}

  def initialize(node)
      @node = node
    end
    
    def extract_data
      { entry_id: entry_id,
        total_votes: total_votes,
        status: entry_status,
        entry_link: entry_link }.merge(image_data)
    end

    private

    def entry_link
      @node.at('.content a').attr('href')
    end

    def entry_id
      @node.attr('id').slice(/\d+/)
    end

    def total_votes
      @node.at('.total span').content.slice(/\d+/)
    end

    def entry_status
      @node.attr('class').slice(/(active)|(rejected)/)
    end

    def image_data
      content_img = @node.at('.content img')
      {
        title: content_img.attr('title'),
        img_path: content_img.attr('src')
      }
    end
  end
end