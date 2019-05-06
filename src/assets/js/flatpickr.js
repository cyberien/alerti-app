//
// flatpickr.js
// Theme module
//

'use strict';

(function() {

  //
  // Variables
  //

  var toggle = document.querySelectorAll('[data-toggle="flatpickr"]');


  //
  // Functions
  //

  function init(el) {
    var options = el.dataset.options;
        options = options ? JSON.parse(options) : {};

    $(el).flatpickr(options);
  }


  //
  // Events
  //

  if (toggle) {
    [].forEach.call(toggle, function(el) {
      init(el);
    });
  }

})();