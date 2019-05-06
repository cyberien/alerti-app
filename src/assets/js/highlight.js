//
// highlight.js
// Theme module
//

'use strict';

(function() {

  //
  // Variables
  //

  var highlight = document.querySelectorAll('.highlight');


  //
  // Functions
  //

  function init(el) {
    hljs.highlightBlock(el);
  }


  //
  // Events
  //

  if (highlight) {
    [].forEach.call(highlight, function(el) {
      init(el);
    });
  }

})();