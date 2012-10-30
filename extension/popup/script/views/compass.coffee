class WLC.Views.Compass extends Backbone.View
  render: ->
    @$el.html(WLC.Templates.compass(this))
    this

  message: ->
    'hi mittens'

  mittens: ->
    [
      'becky'
      'kyle'
    ]