//
// autosize.js
// Theme module
//

'use strict';

(function() {
  
  //
  // Variables
  //

  var toggle = document.querySelectorAll('[data-toggle="autosize"]');


  //
  // Function
  //

  function init(el) {
    autosize(el);
  }


  //
  // Event
  //

  if (toggle) {
    [].forEach.call(toggle, function(el) {
      init(el);
    });
  }

})();