class Scrapers::DerbyEntry

  # Structure of Derby Entry
  #{ 'div.derby-entry' =>
  #  [
  #    {
  #      'div.voteBlock' => {
  #        'div.total' => 'span.innerHTML',
  #        'div#DerbyEntry_\d+' => 'Parse \d+ out <- id'
  #      }
  #    },
  #
  #    {
  #      'div.content' => {
  #        'a' => {
  #          'href' => '/derby/entry/\d*/.*',
  #          'img' => ['title', 'src'],
  #          'div.status' => 'class' }
  #      }
  #    }
  #  ]
  #}

  def initialize(entry_node)
    @entry_node = entry_node
  end

  def create_or_update
    unless already_exists?
      extricate_data
      create!
    end
  end

  private

  def extricate_data
  end

  def create!
  end

  def already_exists?
    ::DerbyEntry.where(entry_id: entry_id).present?
  end

  def entry_id
  end

end