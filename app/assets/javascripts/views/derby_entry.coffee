class DerbyEntry extends Backbone.View

  initialize: (entry) ->
    @entry = entry

  render: ->
    @$el.html(@template(@.model.attributes))


