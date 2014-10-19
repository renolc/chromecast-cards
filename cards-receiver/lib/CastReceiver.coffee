# chrome cast reciever api wrapper
class CastReceiver
  constructor: (namespace) ->

    # properties
    @namespace  = namespace
    @manager    = cast.receiver.CastReceiverManager.getInstance()
    @messageBus = @manager.getCastMessageBus(@namespace, cast.receiver.CastMessageBus.MessageType.JSON)

    # handlers
    @messageBus.onMessage = @onMessage

    # start the receiver
    @manager.start()

  onMessage: (event) ->
    console.log '--message received--'
    console.log event
