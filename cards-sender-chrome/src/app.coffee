namespace = 'urn:x-cast:com.renolc.cards'
appid = 'E1B87031'
submit = document.getElementById("submit")
session = null

window['__onGCastApiAvailable'] = (loaded, errorInfo) ->
  if loaded
    init()
  else
    console.log errorInfo

init = ->
  sessionRequest = new chrome.cast.SessionRequest(appid)
  apiConfig = new chrome.cast.ApiConfig(sessionRequest,
                                        sessionListener,
                                        receiverListener)
  chrome.cast.initialize(apiConfig, onInitSuccess, onError)


receiverListener = (e) ->
  # TODO: do something

sessionListener = (e) ->
  session = e

onInitSuccess = ->
  # TODO: do something

onError = (e) ->
  # TODO: do something

submit.onclick = ->
  session.sendMessage(namespace, true)
