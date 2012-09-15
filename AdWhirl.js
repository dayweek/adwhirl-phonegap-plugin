var AdWhirl = {
     show: function(success, fail) {
          return Cordova.exec(success, fail, "AdWhirl", "showAd", "");
     },
     hide: function(success, fail) {
          return Cordova.exec(success, fail, "AdWhirl", "hideAd", "");
     }
};
  
