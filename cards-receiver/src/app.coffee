namespace = 'urn:x-cast:com.renolc.cards'

castReceiverManager = cast.receiver.CastReceiverManager.getInstance()
castMessageBus = castReceiverManager.getCastMessageBus(namespace,
                                                       cast.receiver.CastMessageBus.MessageType.JSON)

castMessageBus.onMessage = (event) ->
  console.log '--message received--'
  console.log event

castReceiverManager.onSenderDisconnected = (event) ->
  console.log ('onSenderDisconnected')

castReceiverManager.start()

console.log 'receiver started'
