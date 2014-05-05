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
    #      'img' => 'src' },
    #  }
    #  'div.footer' => 'innerHTML'
    #
    #}

    def initialize(node)
      @node = node
    end

    def entry_id
      @node.attr('id').slice(/\d+/)
    end

    def to_hash
      {
        entry_id: entry_id,
        vote_count: vote_count,
        image_path: image_path,
        title: title,
        fog_of_war: fog_of_war
        #status: entry_status,
        #entry_link: entry_link
      }
    end

    def valid?
      entry_id.present?
    end

    def vote_count
      total_vote_content.slice(/\d+/)
    end

    private

    def entry_link
      @node.at('.content a').attr('href')
    end

    def entry_status
      @node.attr('class').slice(/(active)|(rejected)/)
    end

    def title
      @node.at('.footer').content.strip
    end

    def image_path
      @node.at('.content img').attr('src')
    end

    def total_vote_content
      @node.at('.total span').content
    end

    def fog_of_war
      (total_vote_content =~ Regexp.new('\+\?')).present?
    end
  end
end
