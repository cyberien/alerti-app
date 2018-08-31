//
// Layout ==================================
//

'use strict';

var Layout = (function() {

  //
  // Variables
  //

  var $modeToggle = $('#modeToggle');
  var $modeStylesheet = $('link[href*="theme"]');

  //
  // Methods
  //

  function toggleMode() {

  }


  //
  // Events
  //

  $modeToggle.change(function() {
    toggleMode();
  });

})();