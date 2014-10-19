# pixi renderer wrapper
class PIXIRenderer
  constructor: (bgColor) ->

    # properties
    @stage    = new PIXI.Stage(bgColor)
    @renderer = PIXI.autoDetectRenderer()

    # set render view to fill the viewport
    @renderer.view.className = 'rendererView'

    # append renderer view to body
    document.body.appendChild(@renderer.view)

    # start animation loop
    requestAnimFrame(@animate)

  animate: =>
    # keep looping
    requestAnimFrame(@animate)

    # render the stage
    @renderer.render(@stage)
