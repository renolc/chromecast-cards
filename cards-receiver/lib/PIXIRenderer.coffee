# pixi renderer wrapper
class PIXIRenderer
  constructor: (bgColor, width, height) ->

    # properties
    @stage    = new PIXI.Stage(bgColor)
    @renderer = PIXI.autoDetectRenderer(width, height)

    # append renderer view to body
    document.body.appendChild(@renderer.view)

    # start animation loop
    requestAnimFrame(@animate)

  animate: =>
    # keep looping
    requestAnimFrame(@animate)

    # render the stage
    @renderer.render(@stage)
