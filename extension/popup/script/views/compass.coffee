class WLC.Views.Compass extends Backbone.View
  render: ->
    @$el.html(WLC.Templates.compass(this))

    canvas              = $('<canvas/>')[0];
    canvas.height  = 19;
    canvas.width    = 19;
    context             = canvas.getContext("2d");

    context.translate 9.5, 9.5
    context.rotate Math.PI*2*(270/360)
    context.moveTo     0, -7.5
    context.lineTo     7.5,  7.5
    context.lineTo   -7.5,  7.5
    context.lineTo        0, -7.5
    context.strokeStyle = "#000"
    context.stroke()

    imageData = context.getImageData(0,0, canvas.width, canvas.height)
    window.chrome.browserAction.setIcon(imageData: imageData)

    this

  settingsPath: -> WLC.Paths.settings()
  message: -> 'hi mittens'
  mittens: ->
    [
      'becky'
      'kyle'
    ]