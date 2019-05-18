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

  function init(categories) {
    var arr = [];

    for(var i = 0; i < categories.length; i++) {
      arr.push(categories[i]);
    }
    
    dragula(arr);
  }

  function toggleItems(el) {
    var parent = el.closest('.kanban-add');
    var card = parent.querySelector('.card');
    var link = parent.querySelector('.kanban-add-link');
    var form = parent.querySelector('.kanban-add-form');

    link.classList.toggle('d-none');
    form.classList.toggle('d-none');

    if (card) {
      if (card.classList.contains('card-sm')) {
        if (card.classList.contains('card-flush')) {
          card.classList.remove('card-flush');
        } else {
          card.classList.add('card-flush');
        }
      }
    }
  }


  //
  // Events
  //

  if (categories) {
    init(categories);
  }

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
    [].forEach.call(forms, function(el) {
      el.addEventListener('submit', function(e) {
        e.preventDefault();
      });
    });
  }

})();