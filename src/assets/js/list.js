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
  var pageEvents = ['select2:select'];
  var checkboxEvents = ['change'];
  var alertCloseEvent = ['click'];

  /**
   * Functions
   */

  function init(list) {
    var listSorts = list.querySelectorAll('.list-sort');
    var listFilters = list.querySelectorAll('.list-filter');
    var listPages = list.querySelectorAll('.list-pages');
    var listCheckboxes = list.querySelectorAll('.list-checkbox');
    var listCheckboxAll = list.querySelector('.list-checkbox-all');
    var listAlert = list.querySelector('.list-alert');
    var listAlertCount = list.querySelector('.list-alert-count');
    var listAlertClose = list.querySelector('.list-alert .close');
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

    // Sorts
    if (listSorts) {
      [].forEach.call(listSorts, function(sort) {
        sort.addEventListener(sortEvents[0], function(e) {
          e.preventDefault();
        });
      });
    }

    // Filters
    if (listFilters) {
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
    }

    // Pages
    if (listPages) {
      [].forEach.call(listPages, function(select) {
        $(select).on(pageEvents[0], function(e) {
          listObj.page = select.value;
          listObj.update();
        });
      });
    }

    // Checkboxes
    if (listCheckboxes) {
      [].forEach.call(listCheckboxes, function(checkbox) {
        checkbox.addEventListener(checkboxEvents[0], function() {
          countCheckboxes(listCheckboxes, listAlert, listAlertCount);

          if (listCheckboxAll) {
            listCheckboxAll.checked = false;
          }
        });
      });
    }

    // Checkbox
    if (listCheckboxAll) {
      listCheckboxAll.addEventListener(checkboxEvents[0], function() {
        [].forEach.call(listCheckboxes, function(checkbox) {
          checkbox.checked = listCheckboxAll.checked;
        });

        countCheckboxes(listCheckboxes, listAlert, listAlertCount);
      });
    }

    // Alert
    if (listAlertClose) {
      listAlertClose.addEventListener(alertCloseEvent[0], function(e) {
        e.preventDefault();

        if (listCheckboxAll) {
          listCheckboxAll.checked = false;
        }

        [].forEach.call(listCheckboxes, function(checkbox) {
          checkbox.checked = false;
        });

        countCheckboxes(listCheckboxes, listAlert, listAlertCount);
      });
    }
  };

  function countCheckboxes(listCheckboxes, listAlert, listAlertCount) {
    var checked = [].slice.call(listCheckboxes).filter(function(checkbox) {
      return checkbox.checked;
    });

    checked.length ? listAlert.classList.add('show') : listAlert.classList.remove('show');
    listAlertCount.innerHTML = checked.length;
  }

  /**
   * Events
   */

  if (typeof List !== 'undefined' && lists) {
    [].forEach.call(lists, function(list) {
      init(list);
    });
  }
})();
