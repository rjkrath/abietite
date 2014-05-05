module DerbiesHelper

  def full_derby_title(derby)
    "Derby ##{derby.derby_id}: #{derby.title}"
  end

  def derby_entry_link(text, entry)
    link_to(text, "http://shirt.woot.com/#{entry.entry_link}")
  end

end
