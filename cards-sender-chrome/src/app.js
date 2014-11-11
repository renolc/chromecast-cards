// Generated by CoffeeScript 1.8.0
var appid, init, namespace, onError, onInitSuccess, receiverListener, session, sessionListener, submit;

namespace = 'urn:x-cast:com.renolc.cards';

appid = 'E1B87031';

submit = document.getElementById("submit");

session = null;

window['__onGCastApiAvailable'] = function(loaded, errorInfo) {
  if (loaded) {
    return init();
  } else {
    return console.log(errorInfo);
  }
};

init = function() {
  var apiConfig, sessionRequest;
  sessionRequest = new chrome.cast.SessionRequest(appid);
  apiConfig = new chrome.cast.ApiConfig(sessionRequest, sessionListener, receiverListener);
  return chrome.cast.initialize(apiConfig, onInitSuccess, onError);
};

receiverListener = function(e) {};

sessionListener = function(e) {
  return session = e;
};

onInitSuccess = function() {};

onError = function(e) {};

submit.onclick = function() {
  return session.sendMessage(namespace, true);
};
