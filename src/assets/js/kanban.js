//
// kanban.js
// Dashkit module
//

'use strict';

(function() {
  
  //
  // Variables
  //

  var categories = document.querySelectorAll('.kanban-category');
  var items = document.querySelectorAll('.kanban-item');
  var links = document.querySelectorAll('.kanban-add-link');
  var forms = document.querySelectorAll('.kanban-add-form');


  //
  // Functions
  //

  function init() {
    
  }

  function toggleItems(el) {
    var card = el.closest('.kanban-add');
    var link = card.querySelector('.kanban-add-link');
    var form = card.querySelector('.kanban-add-form');

    link.classList.toggle('d-none');
    form.classList.toggle('d-none');

    if (card.classList.contains('card-sm')) {
      if (card.classList.contains('card-flush')) {
        card.classList.remove('card-flush');
      } else {
        card.classList.add('card-flush');
      }
    }
  }


  //
  // Events
  //

  init();

  if (links) {
    [].forEach.call(links, function(el) {
      el.addEventListener('click', function() {
        toggleItems(el);
      });
    });
  }

  if (forms) {
    [].forEach.call(forms, function(el) {
      el.addEventListener('reset', function() {
        toggleItems(el);
      });
    });
  }

})();