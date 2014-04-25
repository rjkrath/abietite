class DerbyEntry extends Backbone.Model

  defaults:
    vote: null
    selected: false

  constructor: ->
    Backbone.Model.apply(@, arguments)

    if @.has('vote_id')
      @.set(
          selected: true,
          vote: new Vote({ id: @.get('vote_id') })
      )

  onClick: ->
    derby_vote = null

    if @.has('vote')
      @.get('vote').destroy
    else
      derby_vote = new Vote({ derby_entry_id: @.id })
      derby_vote.save

    @.set(vote: derby_vote,
          selected: derby_vote?
    )
