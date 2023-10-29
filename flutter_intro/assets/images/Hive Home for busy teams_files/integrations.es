(function(FS) {
  var session = FS.getCurrentSession(), sessionUrl = FS.getCurrentSessionURL();
  function retryWithBackoff(condition, callback, maxWait, failureMsg, timeoutCallback) {
    var totalTimeExpired = 0;
    var wait = 64;
    var resultFn = function() {
      if (condition()) {
        callback();
        return;
      }
      wait = Math.min(wait * 2, 1024);
      if (totalTimeExpired > maxWait) {
        FS.log('warn', failureMsg);
        !!timeoutCallback && timeoutCallback(failureMsg);
        return;
      }
      totalTimeExpired += wait
      setTimeout(resultFn, wait);
    };
    return resultFn;
  }
  function loadSession(key) {
	var lastSession = window['localStorage'].getItem(key);
    if (!lastSession) {
      lastSession = FS._cookies()[key];
    }
    return lastSession
  }
  function saveSession(key, session) {
    window['localStorage'].setItem(key, session);
  }

	var intercomSessionUrl = sessionUrl + '?integration_src=intercom';
    function intercomOnPage() {
      return window['Intercom'] && typeof(Intercom)=="function";
    }
    function intercomBooted() {
      return document.querySelector(".intercom-app, .intercom-lightweight-app");
    }
    function fsIntercomInit() {
      var lastSession = loadSession('fs_intercom');
      if (session != lastSession) {
        saveSession('fs_intercom', session);
        var fsMetadata = {
	      "Session Link": {
	        value: "Play in FullStory",
            url: intercomSessionUrl
          },
          "Session Time": (new Date()).toUTCString()
        };

        Intercom('trackEvent', 'New FullStory Session', fsMetadata);
        retryWithBackoff(intercomBooted, intercomUpdateAttrAsync, 8000, 'The FullStory integration with Intercom loaded, but did not detect that Intercom booted successfully.', intercomInitFailure)();
      }
    }
    retryWithBackoff(intercomOnPage, fsIntercomInit, 30000, 'The FullStory integration with Intercom loaded, but did not detect Intercom on the page.', intercomInitFailure)();

    function intercomUpdateAttrAsync() {
      Intercom('update', {'Latest FullStory Session': intercomSessionUrl});
      FS('stat', {
        eventType: 'INTEGRATION_INITIALIZED',
        payload: {
          provider_id: 'intercom',
          event_status: 'SUCCESS'
        }
      });
    }

    function intercomInitFailure(message) {
      FS('stat', {
        eventType: 'INTEGRATION_INITIALIZED',
        payload: {
          provider_id: 'intercom',
          event_status: 'FAILURE',
          metadata: { detail: message }
        }
      });
    }
	
})(window['_fs_namespace'] ? window[window['_fs_namespace']] : window['FS'])