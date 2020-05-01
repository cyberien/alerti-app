//
// list.js
//

'use strict';

(function() {

  /**
   * Selectors
   */

  var lists = document.querySelectorAll('[data-list]');

  // Events
  var sortEvents = ['click'];
  var resetEvents = ['click'];
  var filterEvents = ['submit'];
  var pageEvents = ['click'];

  /**
   * Functions
   */

  function init(list) {
    var listSorts = list.querySelectorAll('.list-sort');
    var listFilters = list.querySelectorAll('.list-filter');
    var listPages = list.querySelectorAll('.list-pages');
    var listOptions = list.dataset.list && JSON.parse(list.dataset.list);

    var defaultOptions = {
      listClass: 'list',
      paginationClass: 'list-pagination',
      searchClass: 'list-search',
      sortClass: 'list-sort',
      pagination: true
    };

    // Merge options
    var options = Object.assign(defaultOptions, listOptions);

    // Init
    var listObj = new List(list, options);

    // Sort
    [].forEach.call(listSorts, function(sort) {
      sort.addEventListener(sortEvents[0], function(e) {
        e.preventDefault();
      });
    });

    // Filter
    [].forEach.call(listFilters, function(filter) {
      var resets = filter.querySelectorAll('[data-reset]');

      // Filter
      filter.addEventListener(filterEvents[0], function(e) {
        e.preventDefault();

        var fields = filter.querySelectorAll('[name]');

        listObj.filter(function(item) {
          var include = true;

          [].forEach.call(fields, function(field) {
            var name = field.name;
            var value = field.value;

            if (item.values()[name] !== value) {
              include = false;
            }
          });

          return include;
        });
      });

      // Reset
      [].forEach.call(resets, function(reset) {
        reset.addEventListener(resetEvents[0], function(e) {
          e.preventDefault();

          listObj.filter();
        })
      });
    });

    // Pages
    [].forEach.call(listPages, function(select) {
      $(select).on('select2:select', function(e) {
        var value = select.value;

        listObj.page = value;
        listObj.update();
      });
    });
  };

  /**
   * Events
   */

  if (typeof List !== 'undefined' && lists) {
    [].forEach.call(lists, function(list) {
      init(list);
    });
  }
})();
