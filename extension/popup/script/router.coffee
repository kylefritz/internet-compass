class WLC.Router extends Backbone.Router
  routes:
    "*path": "noRoute"
  initialize: (options) ->
    @$el = options.el
    _(WLC.Routes).each (v, k) => @route v, k

  compass: ->       @launch(WLC.Views.Compass)
  settings: ->        @launch(WLC.Views.Settings)

  noRoute: ->
    fragment = Backbone.history.fragment
    if fragment != fragment.toLowerCase()
      #fix uppercase
      WLC.navigate('/'+fragment.toLowerCase())
    else if /\/$/.test(fragment)
      #fix trailing slash
      WLC.navigate('/' + fragment.slice(0,-1))
    else
      @launch(WLC.Views.NoRoute)

  launch: (viewKlass, options) ->
    WLC.Analytics.trackPage()
    t0 = new Date()
    view = new viewKlass(options)
    WLC.view = view
    done = () =>
      @render view
      WLC.Analytics.trackLoad(t0)
    if view.ready
      view.ready.done(done)
      view.ready.fail (xhr) ->
        WLC.Analytics.trackLoad(t0)
        if (xhr and (xhr.status is 401 or xhr.status is 403))
          WLC.navigate WLC.Paths.login(returnUrl: '/' + Backbone.history.fragment)
        else
          WLC.errorHandler()
    else
      done()

  render: (view) ->
    @$el.empty()
    window.scrollTo(0,1)
    @$el.append view.render().el
