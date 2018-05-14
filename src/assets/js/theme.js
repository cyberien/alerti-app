/**
 * Theme JS
 */

'use strict';


/*** Charts ***/

var Charts = (function() {

  // Variables
  // =========

  // Charts
  var charts = {
    barChart: $('#barChart'),
    lineChart: $('#lineChart'),
    donutChart: $('#donutChart')
  };

  // Fonts
  var fonts = {
    base: 'Cerebri Sans'
  }

  // Colors
  var colors = {
    primary: {
      100: '#D2DDEC',
      300: '#A6C5F7',
      700: '#2C7BE5',
    },
    gray: {
      100: '#95AAC9',
      300: '#E3EBF6',
      700: '#6E84A3'
    },
    transparent: 'transparent'
  };

  // Options
  //
  // Set as global to allow overrides via chart specific options

  // General
  Chart.defaults.global.responsive = true;
  Chart.defaults.global.maintainAspectRatio = false;

  // Colors
  Chart.defaults.global.defaultColor = colors.primary[700];

  // Fonts
  Chart.defaults.global.defaultFontColor = colors.gray[700];
  Chart.defaults.global.defaultFontFamily = fonts.base;
  Chart.defaults.global.defaultFontSize = 13;

  // Layout
  Chart.defaults.global.layout.padding = 0;

  // Legend
  Chart.defaults.global.legend.display = false;

  // Point
  Chart.defaults.global.elements.point.radius = 0;

  // Line
  Chart.defaults.global.elements.line.tension = .4;
  Chart.defaults.global.elements.line.borderWidth = 3;
  Chart.defaults.global.elements.line.borderColor = colors.primary[700];
  Chart.defaults.global.elements.line.backgroundColor = colors.transparent;
  Chart.defaults.global.elements.line.borderCapStyle = 'rounded';

  // Rectangle
  Chart.defaults.global.elements.rectangle.backgroundColor = colors.primary[700];

  // Arc
  Chart.defaults.global.elements.arc.borderWidth = 4;
  Chart.defaults.global.elements.arc.backgroundColor = colors.primary[700];

  // Doughnuts
  Chart.defaults.doughnut.cutoutPercentage = 83;

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


  // Methods
  // =======

  var init = {
    barChart: function() {
      new Chart(charts.barChart, {
        type: 'bar',
        data: {
          labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
          datasets: [{
            data: [0,10,5,15,10,20,15,25,20,30,25,40]
          }]
        }
      });
    },
    donutChart: function() {
      new Chart(charts.donutChart, {
        type: 'doughnut',
        data: {
          labels: ['Desktop', 'Tablet', 'Mobile'],
          datasets: [{
            data: [60,25,15],
            backgroundColor: [
              colors.primary[700],
              colors.primary[300],
              colors.primary[100]
            ]
          }]
        }
      });
    },
    lineChart: function() {
      new Chart(charts.lineChart, {
        type: 'line',
        data: {
          labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
          datasets: [{
            data: [0,10,5,15,10,20,15,25,20,30,25,40]
          }]
        }
      });
    }
  };


  // Events
  // ======

  // Init charts
  //
  // Only init the charts present of the page

  for( var chart in charts ) {

    if ( chart.length ) {
      init[chart]();
    }
  }
  
})();


/*** Navbar ***/

var Navbar = (function() {


  // Variables
  // =========

  var $nav = $('.navbar-nav, .navbar-nav .nav');
  var $navCollapse = $('.navbar-nav .collapse');


  // Methods
  // =======

  function accordion($this) {
    $this.closest($nav).find($navCollapse).not($this).collapse('hide');
  }


  // Events
  // ======

  $navCollapse.on({
    'show.bs.collapse': function() {
      accordion( $(this) );
    }
  })
  
})();