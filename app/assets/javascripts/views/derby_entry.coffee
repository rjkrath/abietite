window.app ||= {}

class app.DerbyEntry extends Backbone.View

  template: _.template(app.DerbyEntryTemplate)

  initialize: (entry) ->
    @entry = entry

  render: ->
    @$el.html(@template(@.model.attributes))


