stage    = null
renderer = null
manager  = null
bus      = null

suits = [
  'spades',
  'clubs',
  'hearts',
  'diamonds'
]

values = [
  'ace',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  'jack',
  'queen',
  'king'
]

sides = [
  'bottom',
  'top',
  'left',
  'right'
]

init = ->
  # setup pixi renderer
  stage    = new PIXI.Stage(0x66FF99)
  renderer = PIXI.autoDetectRenderer(window.innerWidth - 15, window.innerHeight - 15, null, false, true)

  manager = cast.receiver.CastReceiverManager.getInstance()
  bus     = manager.getCastMessageBus('urn:x-cast:com.renolc.cards', cast.receiver.CastMessageBus.MessageType.JSON)

  # handlers
  bus.onMessage = on_message

  # append renderer view to body
  document.body.appendChild(renderer.view)

  # start animation loop
  requestAnimFrame(animate)

  # start the receiver
  manager.start()

  ###
  !!!!!!!!!!!!!!!!!! DEEBUG ONLY !!!!!!!!!!!!!!!!!!!!!!!!!!!
  ###
  stage.click = ->
    throw_card()

###
PIXI methods
###

throw_card = (value, suit, side) ->
  if !value?
    value = values.random()

  if !suit?
    suit = suits.random()

  if !side?
    side = sides.random()

  card = create_card(value, suit)

  random_offset_x = Math.randomBetween(-50, 50)
  random_offset_y = Math.randomBetween(-50, 50)

  switch side
    when 'bottom'
      y = window.innerHeight + 200
      x = window.innerWidth  / 2
    when 'top'
      y = -200
      x = window.innerWidth / 2
    when 'left'
      y = window.innerHeight / 2
      x = -200
    when 'right'
      y = window.innerHeight / 2
      x = window.innerWidth  + 200

  card.position = new PIXI.Point(x, y)

  stage.addChild(card)

  setTimeout(->
    new TWEEN.Tween(card)
      .to({
        x:        window.innerWidth  / 2 + random_offset_x,
        y:        window.innerHeight / 2 + random_offset_y,
        rotation: Math.randomBetween(-5, 5)
      }, 850)
      .easing(TWEEN.Easing.Circular.Out)
      .start()
  , 200)

create_card = (value, suit) ->
  card = new PIXI.Sprite.fromImage("img/cards/#{value}_of_#{suit}.png")

  card.anchor.x = 0.5
  card.anchor.y = 0.5

  card.scale = new PIXI.Point(0.3, 0.3)

  card

animate = (time) ->
  # keep looping
  requestAnimFrame(animate)

  # update tweens
  TWEEN.update(time)

  # render the stage
  renderer.render(stage)

###
Chromecast methods
###

on_message = (event) ->
  throw_card(event.data.value, event.data.suit, event.data.side)

###
Util methods
###

Array.prototype.random = ->
  return if this.length == 0
  this[Math.floor(Math.random() * this.length)]

Math.randomBetween = (min, max) ->
  return Math.random() * (max - min) + min

init()
