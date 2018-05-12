/**
 * Theme JS
 */

'use strict';


/*** Charts ***/

var Charts = (function() {

  // Variables
  // =========

  // Fonts

  var fonts = {
    base: 'Cerebri Sans'
  }

  // Charts
  var charts = {
    lineChart: $('#lineChart'),
    barChart: $('#barChart')
  };

  // Colors
  var colors = {
    primary: '#2c7be5',
    gray: {
      300: '#E3EBF6',
      700: '#6E84A3'
    },
    transparent: 'transparent'
  };

  // Options
  var options = {
    responsive: true,
    maintainAspectRatio: false,
    scales: {
      yAxes: [{
        gridLines: {
          borderDash: [2],
          borderDashOffset: [2],
          color: colors.gray['300'],
          drawBorder: false,
          drawTicks: false,
          lineWidth: 0,
          zeroLineWidth: 0,
          zeroLineColor: colors.gray['300'],
          zeroLineBorderDash: [2],
          zeroLineBorderDashOffset: [2]
        },
        ticks: {
          beginAtZero: true,
          callback: function(value) {
            if ( !(value % 10) ) {
              return '$' + value + 'k'
            }
          },
          fontColor: colors.gray['700'],
          fontFamily: fonts.base,
          fontSize: 13,
          padding: 10
        }
      }],
      xAxes: [{
        gridLines: {
          drawBorder: false,
          drawOnChartArea: false,
          drawTicks: false
        },
        ticks: {
          fontColor: colors.gray['700'],
          fontFamily: fonts.base,
          fontSize: 13,
          padding: 20
        },
        maxBarThickness: 10
      }]
    },
    layout: {
      padding: 0
    },
    legend: {
      display: false
    },
    elements: {
      point: {
        radius: 0
      },
      line: {
        tension: .5,
        borderWidth: 4,
        borderColor: colors.primary,
        backgroundColor: colors.transparent,
        borderCapStyle: 'rounded'
      },
      rectangle: {
        backgroundColor: colors.primary
      }
    }
  };


  // Methods
  // =======

  var init = {
    barChart: function() {
      new Chart(charts.barChart, {
        type: 'bar',
        options: options,
        data: {
          labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
          datasets: [{
            data: [0,10,5,15,10,20,15,25,20,30,25,40]
          }]
        }
      });
    },
    lineChart: function() {
      new Chart(charts.lineChart, {
        type: 'line',
        options: options,
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