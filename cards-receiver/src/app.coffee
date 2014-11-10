# setup chromecast receiver
#receiver = new CastReceiver('urn:x-cast:com.renolc.cards')

# setup pixi renderer
stage    = new PIXI.Stage(0x66FF99)
renderer = PIXI.autoDetectRenderer(window.innerWidth, window.innerHeight, null, false, true)

# append renderer view to body
document.body.appendChild(renderer.view)

card = new PIXI.Sprite.fromImage("img/cards/ace_of_spades.png")

card.scale = new PIXI.Point(0.4, 0.4)

card.anchor.x = 0.5
card.anchor.y = 0.5

card.position.x = window.innerWidth  / 2
card.position.y = window.innerHeight + 150

stage.addChild(card)

new TWEEN.Tween(card)
  .to({
    y:        window.innerHeight / 2,
    rotation: Math.random() * 10 - 5
  }, 500)
  .easing(TWEEN.Easing.Exponential.Out)
  .start()

animate = ->
  # keep looping
  requestAnimFrame(animate)

  TWEEN.update()

  # render the stage
  renderer.render(stage)

# start animation loop
requestAnimFrame(animate)
