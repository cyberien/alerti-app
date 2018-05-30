//
// theme.js
// Theme specific JavaScript
//

'use strict';

//
// ThemeCharts ==================================
//

var ThemeCharts = (function() {

  // Variables
  // 
  // Theme chart variables

  // Fonts

  var fonts = {
    base: 'Cerebri Sans'
  }

  // Colors

  var colors = {
    gray: {
      100: '#95AAC9',
      300: '#E3EBF6',
      700: '#6E84A3',
      900: '#283E59'
    },
    primary: {
      100: '#D2DDEC',
      300: '#A6C5F7',
      700: '#2C7BE5',
    },
    white: '#FFFFFF',
    transparent: 'transparent',
  };

  // Options

  var options = {
    defaults: {
      global: {
        responsive: true,
        maintainAspectRatio: false,
        defaultColor: colors.primary[700],
        defaultFontColor: colors.gray[700],
        defaultFontFamily: fonts.base,
        defaultFontSize: 13,
        layout: {
          padding: 0
        },
        legend: {
          display: false,
          position: 'bottom',
          labels: {
            usePointStyle: true
          }
        },
        elements: {
          point: {
            radius: 0
          },
          line: {
            tension: .4,
            borderWidth: 3,
            borderColor: colors.primary[700],
            backgroundColor: colors.transparent,
            borderCapStyle: 'rounded'
          },
          rectangle: {
            backgroundColor: colors.primary[700]
          },
          arc: {
            borderWidth: 4,
            backgroundColor: colors.primary[700]
          }
        }
      },
      doughnut: {
        cutoutPercentage: 83
      }
    }
  }

  // yAxes

  Chart.scaleService.updateScaleDefaults('linear', {
    gridLines: {
      borderDash: [2],
      borderDashOffset: [2],
      color: colors.gray[300],
      drawBorder: false,
      drawTicks: false,
      lineWidth: 0,
      zeroLineWidth: 0,
      zeroLineColor: colors.gray[300],
      zeroLineBorderDash: [2],
      zeroLineBorderDashOffset: [2]
    },
    ticks: {
      beginAtZero: true,
      padding: 10,
      callback: function(value) {
        if ( !(value % 10) ) {
          return '$' + value + 'k'
        }
      }
    }
  });

  // xAxes

  Chart.scaleService.updateScaleDefaults('category', {
    gridLines: {
      drawBorder: false,
      drawOnChartArea: false,
      drawTicks: false
    },
    ticks: {
      padding: 20
    },
    maxBarThickness: 10
  });

  // Tabs

  var $chartTabs = $('[data-toggle="tab"][data-chart]');


  // Methods
  //
  // Theme chart functions

  // Parse global options

  function parseOptions(parent, options) {
    for (var item in options) {
      if (typeof options[item] !== 'object') {
        parent[item] = options[item];
      } else {
        parseOptions(parent[item], options[item]);
      }
    }
  }

  // Toggle chart types and datasets on tab click

  function toggleCharts(tab) {
    var chart = tab.data('target');
    var data = tab.data('chart');

    updateChart(chart, data);
  }

  // Update chart

  function updateChart(chart, data) {
    var currentChart = window[chart];

    // Update settings
    parseOptions(currentChart, data);

    // Draw chart
    currentChart.update();
  }


  // Events
  //
  // Run functions on windows load or special events

  // Parse global options

  parseOptions(Chart, options);

  // Toggle chart types and datasets on tab click

  $chartTabs.on({
    'shown.bs.tab': function() {
      toggleCharts($(this));
    }
  });


  // Return
  //
  // Make variables global

  return {
    fonts: fonts,
    colors: colors,
    options: options
  };
  
})();


//
// Header ==================================
// Header card charts
//

var Header = (function() {

  // Variables

  var $headerChart = $('#headerChart');

  // Init
  //
  // Init header chart

  function init(chart) {
    window.headerChart = new Chart(chart, {
      type: 'line',
      options: {
        scales: {
          yAxes: [{
            gridLines: {
              color: ThemeCharts.colors.gray[900],
              zeroLineColor: ThemeCharts.colors.gray[900]
            }
          }]
        }
      },
      data: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        datasets: [{
          data: [0,10,5,15,10,20,15,25,20,30,25,40]
        }]
      }
    });
  }

  // Events
  //
  // Header chart events

  if ($headerChart.length) {
    init($headerChart);
  }

})();


//
// Performance ==================================
// Performance card charts
//

var Performance = (function() {

  // Variables

  var $performanceChart = $('#performanceChart');

  // Init
  //
  // Init header chart

  function init(chart) {
    performanceChart = new Chart(chart, {
      type: 'line',
      data: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        datasets: [{
          data: [0,10,5,15,10,20,15,25,20,30,25,40]
        }]
      }
    });
  }

  // Events
  //
  // Performance chart events

  if ($performanceChart.length) {
    init($performanceChart);
  }

})();


//
// Orders ==================================
// Orders card charts
//

var Orders = (function() {

  // Variables

  var $ordersChart = $('#ordersChart');

  // Init
  //
  // Init header chart

  function init(chart) {
    window.ordersChart = new Chart(chart, {
      type: 'bar',
      data: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        datasets: [{
          data: [25,20,30,22,17,10,18,26,28,26,20,32]
        }]
      }
    });
  }

  // Events
  //
  // Orders chart events

  if ($ordersChart.length) {
    init($ordersChart);
  }

})();


//
// Devices ==================================
// Devices card charts
//

var Devices = (function() {

  // Variables

  var $devicesChart = $('#devicesChart');

  // Init
  //
  // Init header chart

  function init(chart) {
    window.devicesChart = new Chart(chart, {
      type: 'doughnut',
      options: {
        legend: {
          display: true
        }
      },
      data: {
        labels: ['Desktop', 'Tablet', 'Mobile'],
        datasets: [{
          data: [60,25,15],
          backgroundColor: [
            ThemeCharts.colors.primary[700],
            ThemeCharts.colors.primary[300],
            ThemeCharts.colors.primary[100]
          ],
          hoverBorderColor: ThemeCharts.colors.white
        }]
      }
    });
  }

  // Events
  //
  // Devices chart events

  if ($devicesChart.length) {
    init($devicesChart);
  }

})();


//
// Weekly hours ==================================
// Weekly hours card charts
//

var WeeklyHours = (function() {

  // Variables

  var $weeklyHoursChart = $('#weeklyHoursChart');

  // Init
  //
  // Init header chart

  function init(chart) {
   window.weeklyHoursChart = new Chart(chart, {
      type: 'bar',
      options: {
        scales: {
          yAxes: [{
            ticks: {
              beginAtZero: true,
              padding: 10,
              callback: function(value) {
                if ( !(value % 10) ) {
                  return value + 'hrs'
                }
              }
            }
          }]
        }
      },
      data: {
        labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
        datasets: [{
          data: [21, 12, 28, 15, 5, 12, 17, 2]
        }]
      }
    });
  }

  // Events
  //
  // Weekly hours chart events

  if ($weeklyHoursChart.length) {
    init($weeklyHoursChart);
  }

})();


//
// Navbar ==================================
//


var Navbar = (function() {


  // Variables

  var $nav = $('.navbar-nav, .navbar-nav .nav');
  var $navCollapse = $('.navbar-nav .collapse');

  // Methods
  //
  // Navbar methods

  function accordion($this) {
    $this.closest($nav).find($navCollapse).not($this).collapse('hide');
  }

  // Events
  //
  // Navbar events

  $navCollapse.on({
    'show.bs.collapse': function() {
      accordion( $(this) );
    }
  })
  
})();


//
// Tooltips ==================================
//


var Tooltip = (function() {

  // Variables

  var $tooltip = $('[data-toggle="tooltip"]');

  // Methods
  //
  // Tooltips methods

  function init() {
    $tooltip.tooltip();
  }

  // Events
  //
  // Tooltip events

  if( $tooltip.length ) {
    init();
  }
  
})();