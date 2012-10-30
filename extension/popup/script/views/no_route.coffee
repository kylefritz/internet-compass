class WLC.Views.NoRoute extends Backbone.View
  render: ->
    @$el.html("<h1>Nothing matches that route!</h1>")
    this