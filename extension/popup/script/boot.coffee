window.WLC = ($root) ->
  WLC.router = new WLC.Router(el: $root.find('#page'))
  WLC.captureLinks($root)
  WLC.captureForms($root)
  Backbone.history.start root: WLC.Paths.root()

WLC.Collections = {}
WLC.Models = {}
WLC.Views = {}
WLC.Templates = HandlebarsTemplates
WLC.Mixins = {}
WLC.Helpers = {}
WLC.Routes =
  compass:                           ''
  settings:                            'settings'

WLC.Paths =
  root: ->                      '/popup.html#' + WLC.Routes.compass
  compass: ->              '/popup.html#' + WLC.Routes.compass
  settings: ->                '/popup.html#' + WLC.Routes.settings

WLC.navigate = (path) ->              Backbone.history.navigate path, trigger: true

WLC.hardNavigate = (path) ->      window.location = path

WLC.captureLinks = ($el) ->
  $el.on "click", "a", (evt) ->
    href = $(this).attr("href")

    if $(this).hasClass('disabled') #no nav on disabled.
      evt.preventDefault()
    # else
      # matches = /^\/(.*)/i.exec href
      # if matches?
      #   evt.preventDefault()
      #   Backbone.history.navigate matches[1], trigger: true

WLC.captureForms = ($el) ->
  $el.on "submit", "form", (evt) ->
    action = $(this).attr("action")
    unless action
      evt.preventDefault()

WLC.Analytics =
  track: (args) ->
    window._gaq = window._gaq || [];
    window._gaq.push(args)

  trackPage: ->
    @track(['_trackPageview', Backbone.history.fragment]);

  trackLoad: (t0) ->
    @track(['_trackTiming', 'chrome-extension', 'page load', new Date()-t0, 'ready', 100]);

WLC.errorHandler = (event) ->
  $('body').addClass('js-error')
  WLC.Analytics.track [
    '_trackEvent'
    'chrome-extension'
    'js-error'
    document.location.toString()]