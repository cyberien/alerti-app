//
// list.js
//

'use strict';

(function() {
  var lists = document.querySelectorAll('[data-list]');
  var listSorts = document.querySelectorAll('[data-sort]');
  var sortEvents = ['click'];

  function init(list) {
    var listOptions = list.dataset.list && JSON.parse(list.dataset.list);

    var defaultOptions = {
      listClass: 'list',
      paginationClass: 'list-pagination',
      searchClass: 'list-search',
      sortClass: 'list-sort'
    };

    var options = Object.assign(defaultOptions, listOptions);

    // Init
    var listObj = new List(list, options);
  };

  if (typeof List !== 'undefined' && lists) {
    [].forEach.call(lists, function(list) {
      init(list);
    });

    [].forEach.call(listSorts, function(sort) {
      sort.addEventListener(sortEvents[0], function(e) {
        e.preventDefault();
      });
    });
  }
})();
