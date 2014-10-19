namespace = 'urn:x-cast:com.renolc.cards'
appid = 'E1B87031'

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
  console.log 'receiverListener'
  console.log e

sessionListener = (e) ->
  console.log 'sessionListener'
  console.log e

onInitSuccess = ->
  console.log 'onInitSuccess'

onError = (e) ->
  console.log 'onError'
  console.log e