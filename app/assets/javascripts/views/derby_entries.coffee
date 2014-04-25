class DerbyEntries extends Backbone.View
  events: {
    'click .entry.unselected': 'addEntry',
    'click .entry.selected': 'removeEntry'
  }

  el: $('.derby-entries')

  render: =>
    @collection.each (entry) ->
      $(@el).append(new DerbyEntry(entry).el)



