namespace = 'urn:x-cast:com.renolc.cards'

castReceiverManager = cast.receiver.CastReceiverManager.getInstance()
castMessageBus = castReceiverManager.getCastMessageBus(namespace,
                                                       cast.receiver.CastMessageBus.MessageType.JSON)

castMessageBus.onMessage = (event) ->
  console.log '--message received--'
  console.log event
  document.body.innerHTML += event.data.bork + '<br>'

castReceiverManager.onSenderDisconnected = (event) ->
  console.log ('onSenderDisconnected')
  window.close()

castReceiverManager.start()

console.log 'receiver started'
