//
// list.js
//

(function() {
  var lists = document.querySelectorAll('[data-list]');
  var sorts = document.querySelectorAll('[data-sort]');

  function init(list) {
    var listOptions = list.dataset.list && JSON.parse(list.dataset.list);

    var defaultOptions = {
      listClass: 'list',
      searchClass: 'list-search',
      sortClass: 'list-sort'
    };

    // Merge options
    var options = Object.assign(defaultOptions, listOptions);

    // Init
    new List(list, options);
  }

  if (typeof List !== 'undefined' && lists) {
    [].forEach.call(lists, function(list) {
      init(list);
    });
  }

  if (typeof List !== 'undefined' && sorts) {
    [].forEach.call(sorts, function(sort) {
      sort.addEventListener('click', function(e) {
        e.preventDefault();
      });
    });
  }
})();
