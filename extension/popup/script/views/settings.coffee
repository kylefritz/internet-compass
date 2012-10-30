class WLC.Views.Settings extends Backbone.View
  render: ->
    @$el.html(WLC.Templates.settings(this))
    this

  compassPath: -> WLC.Paths.compass()