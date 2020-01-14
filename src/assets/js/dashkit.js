//
// dashkit.js
// Theme module
//

'use strict';

// Audience chart

(function() {

  //
  // Variables
  //

  var chart = document.getElementById('audienceChart');

  //
  // Functions
  //

  function init(chart) {
    new Chart(chart, {
      type: 'line',
      options: {
        scales: {
          yAxes: [{
            gridLines: {
              color: '#283E59',
              zeroLineColor: '#283E59'
            },
            ticks: {
              callback: function(value) {
                if (!(value % 10)) {
                  return value + 'k';
                }
              }
            }
          }]
        },
        tooltips: {
          callbacks: {
            label: function(item, data) {
              var label = data.datasets[item.datasetIndex].label || '';
              var yLabel = item.yLabel;
              var content = '';

              if (data.datasets.length > 1) {
                content += '<span class="popover-body-label mr-auto">' + label + '</span>';
              }

              content += '<span class="popover-body-value">' + yLabel + 'k</span>';
              return content;
            }
          }
        }
      },
      data: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        datasets: [{
          label: 'Audience',
          data: [0, 10, 5, 15, 10, 20, 15, 25, 20, 30, 25, 40]
        }]
      }
    });
  };

  //
  // Events
  //

  if (typeof Chart !== 'undefined' && chart) {
    init(chart);
  }

})();

// Convertions chart

(function() {
  var chart = document.getElementById('conversionsChart');

  if (typeof Chart !== 'undefined' && chart) {
    new Chart(chart, {
      type: 'bar',
      options: {
        scales: {
          yAxes: [{
            ticks: {
              callback: function(value) {
                return value + '%';
              }
            }
          }]
        }
      },
      data: {
        labels: ['Oct 1', 'Oct 2', 'Oct 3', 'Oct 4', 'Oct 5', 'Oct 6', 'Oct 7', 'Oct 8', 'Oct 9', 'Oct 10', 'Oct 11', 'Oct 12'],
        datasets: [{
          label: '2019',
          data: [25, 20, 30, 22, 17, 10, 18, 26, 28, 26, 20, 32]
        }]
      }
    });
  }

})();

// Traffic chart

(function() {

  //
  // Variables
  //

  var chart = document.getElementById('trafficChart');

  //
  // Functions
  //

  function init(chart) {
    new Chart(chart, {
      type: 'doughnut',
      options: {
        tooltips: {
          callbacks: {
            afterLabel: function() {
              return '%'
            }
          }
        }
      },
      data: {
        labels: ['Direct', 'Organic', 'Referral'],
        datasets: [{
          data: [60, 25, 15],
          backgroundColor: ['#2C7BE5', '#A6C5F7', '#D2DDEC']
        }]
      }
    });
  }

  //
  // Events
  //

  if (typeof Chart !== 'undefined' && chart) {
    init(chart);
  }

})();

// Followers chart

(function() {

  //
  // Variables
  //

  var chart = document.getElementById('followersChart');

  //
  // Functions
  //

  function init(chart) {
    new Chart(chart, {
      type: 'line',
      options: {
        scales: {
          yAxes: [{
            ticks: {
              callback: function(value) {
                if (!(value % 10)) {
                  return value + 'k'
                }
              }
            }
          }]
        },
        tooltips: {
          callbacks: {
            label: function(item, data) {
              var label = data.datasets[item.datasetIndex].label || '';
              var yLabel = item.yLabel;
              var content = '';

              if (data.datasets.length > 1) {
                content += '<span class="popover-body-label mr-auto">' + label + '</span>';
              }

              content += '<span class="popover-body-value">' + yLabel + 'k</span>';
              return content;
            }
          }
        }
      },
      data: {
        labels: ['Oct 1', 'Oct 2', 'Oct 3', 'Oct 4', 'Oct 5', 'Oct 6', 'Oct 7', 'Oct 8', 'Oct 9', 'Oct 10', 'Oct 11', 'Oct 12'],
        datasets: [{
          label: 'Facebook',
          data: [50, 75, 35, 25, 55, 87, 67, 53, 25, 80, 87, 45],
          borderColor: '#4267B2'
        }, {
          label: 'Twitter',
          data: [40, 57, 25, 50, 57, 32, 46, 28, 59, 34, 52, 48],
          borderColor: '#1DA1F2'
        }]
      }
    });
  }

  //
  // Events
  //

  if (typeof Chart !== 'undefined' && chart) {
    init(chart);
  }

})();

// Sales chart

(function() {

  //
  // Variables
  //

  var chart = document.getElementById('salesChart');

  //
  // Functions
  //

  function init(chart) {
    new Chart(chart, {
      type: 'line',
      options: {
        scales: {
          yAxes: [{
            ticks: {
              callback: function(value) {
                if (!(value % 10)) {
                  return '$' + value + 'k'
                }
              }
            }
          }]
        },
        tooltips: {
          callbacks: {
            label: function(item, data) {
              var label = data.datasets[item.datasetIndex].label || '';
              var yLabel = item.yLabel;
              var content = '';

              if (data.datasets.length > 1) {
                content += '<span class="popover-body-label mr-auto">' + label + '</span>';
              }

              content += '<span class="popover-body-value">$' + yLabel + 'k</span>';
              return content;
            }
          }
        }
      },
      data: {
        labels: ['Oct 1', 'Oct 3', 'Oct 6', 'Oct 9', 'Oct 12', 'Oct 5', 'Oct 18', 'Oct 21', 'Oct 24', 'Oct 27', 'Oct 30'],
        datasets: [{
          label: 'Performance',
          data: [0, 10, 5, 15, 10, 20, 15, 25, 20, 30, 25]
        }]
      }
    });
  }

  //
  // Events
  //

  if (typeof Chart !== 'undefined' && chart) {
    init(chart);
  }

})();

// Orders chart

(function() {

  //
  // Variables
  //

  var chart = document.getElementById('ordersChart');

  //
  // Functions
  //

  function init(chart) {
    new Chart(chart, {
      type: 'bar',
      options: {
        scales: {
          yAxes: [{
            ticks: {
              callback: function(value) {
                if (!(value % 10)) {
                  return '$' + value + 'k'
                }
              }
            }
          }]
        },
        tooltips: {
          callbacks: {
            label: function(item, data) {
              var label = data.datasets[item.datasetIndex].label || '';
              var yLabel = item.yLabel;
              var content = '';

              if (data.datasets.length > 1) {
                content += '<span class="popover-body-label mr-auto">' + label + '</span>';
              }

              content += '<span class="popover-body-value">$' + yLabel + 'k</span>';
              return content;
            }
          }
        }
      },
      data: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
        datasets: [{
          label: 'Sales',
          data: [25, 20, 30, 22, 17, 10, 18, 26, 28, 26, 20, 32, 25, 20, 30, 22, 17, 10]
        }]
      }
    });
  }

  //
  // Events
  //

  if (typeof Chart !== 'undefined' && chart) {
    init(chart);
  }

})();

// Earnings chart

(function() {

  //
  // Variables
  //

  var chart = document.getElementById('earningsChart');

  //
  // Functions
  //

  function init(chart) {
    new Chart(chart, {
      type: 'bar',
      options: {
        scales: {
          yAxes: [{
            ticks: {
              callback: function(value) {
                if (!(value % 10)) {
                  return '$' + value + 'k';
                }
              }
            }
          }]
        },
        tooltips: {
          callbacks: {
            label: function(item, data) {
              var label = data.datasets[item.datasetIndex].label || '';
              var yLabel = item.yLabel;
              var content = '';

              if (data.datasets.length > 1) {
                content += '<span class="popover-body-label mr-auto">' + label + '</span>';
              }

              content += '<span class="popover-body-value">$' + yLabel + 'k</span>';
              return content;
            }
          }
        }
      },
      data: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
        datasets: [{
          label: 'Earnings',
          data: [18, 10, 5, 15, 10, 20, 15, 25, 20, 26, 25, 29, 18, 10, 5, 15, 10, 20]
        }]
      }
    });
  };

  //
  // Events
  //

  if (typeof Chart !== 'undefined' && chart) {
    init(chart);
  }

})();

// Weekly hours chart

(function() {

  //
  // Variables
  //

  var chart = document.getElementById('weeklyHoursChart');

  //
  // Functions
  //

  function init(chart) {
    new Chart(chart, {
      type: 'bar',
      options: {
        scales: {
          yAxes: [{
            ticks: {
              callback: function(value) {
                if (!(value % 10)) {
                  return value + 'hrs'
                }
              }
            }
          }]
        },
        tooltips: {
          callbacks: {
            label: function(item, data) {
              var label = data.datasets[item.datasetIndex].label || '';
              var yLabel = item.yLabel;
              var content = '';

              if (data.datasets.length > 1) {
                content += '<span class="popover-body-label mr-auto">' + label + '</span>';
              }

              content += '<span class="popover-body-value">' + yLabel + 'hrs</span>';
              return content;
            }
          }
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

  //
  // Events
  //

  if (typeof Chart !== 'undefined' && chart) {
    init(chart);
  }

})();

// Overview chart

(function() {

  //
  // Variables
  //

  var chart = document.getElementById('overviewChart');

  //
  // Functions
  //

  function init(chart) {
    new Chart(chart, {
      type: 'line',
      options: {
        scales: {
          yAxes: [{
            ticks: {
              callback: function(value) {
                if (!(value % 10)) {
                  return '$' + value + 'k'
                }
              }
            }
          }]
        },
        tooltips: {
          callbacks: {
            label: function(item, data) {
              var label = data.datasets[item.datasetIndex].label || '';
              var yLabel = item.yLabel;
              var content = '';

              if (data.datasets.length > 1) {
                content += '<span class="popover-body-label mr-auto">' + label + '</span>';
              }

              content += '<span class="popover-body-value">$' + yLabel + 'k</span>';
              return content;
            }
          }
        }
      },
      data: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        datasets: [{
          label: 'Performance',
          data: [0, 10, 5, 15, 10, 20, 15, 25, 20, 30, 25, 40]
        }]
      }
    });
  }

  //
  // Events
  //

  if (chart) {
    init(chart);
  }

})();

// Sparkline chart

(function() {

  //
  // Variables
  //

  var chart = document.getElementById('sparklineChart');

  //
  // Functions
  //

  function init(chart) {
    new Chart(chart, {
      type: 'line',
      options: {
        scales: {
          yAxes: [{
            display: false
          }],
          xAxes: [{
            display: false
          }]
        },
        elements: {
          line: {
            borderWidth: 2
          },
          point: {
            hoverRadius: 0
          }
        },
        tooltips: {
          custom: function() {
            return false;
          }
        }
      },
      data: {
        labels: new Array(12),
        datasets: [{
          data: [0, 15, 10, 25, 30, 15, 40, 50, 80, 60, 55, 65]
        }]
      }
    });
  };

  //
  // Events
  //

  if (typeof Chart !== 'undefined' && chart) {
    init(chart);
  }

})();

// Sparkline chart (gray)

(function() {

  //
  // Variables
  //

  var charts = document.querySelectorAll('#sparklineChartSocialOne, #sparklineChartSocialTwo, #sparklineChartSocialThree, #sparklineChartSocialFour');

  //
  // Functions
  //

  function init(chart) {
    new Chart(chart, {
      type: 'line',
      options: {
        scales: {
          yAxes: [{
            display: false
          }],
          xAxes: [{
            display: false
          }]
        },
        elements: {
          line: {
            borderWidth: 2,
            borderColor: '#D2DDEC'
          },
          point: {
            hoverRadius: 0
          }
        },
        tooltips: {
          custom: function() {
            return false;
          }
        }
      },
      data: {
        labels: new Array(12),
        datasets: [{
          data: [0, 15, 10, 25, 30, 15, 40, 50, 80, 60, 55, 65]
        }]
      }
    });
  };

  //
  // Events
  //

  if (typeof Chart !== 'undefined' && charts) {
    [].forEach.call(charts, function(el) {
      init(el);
    });
  }

})();

// Feed chart

(function() {

  //
  // Variables
  //

  var chart = document.getElementById('feedChart');

  //
  // Functions
  //

  function init(chart) {
    new Chart(chart, {
      type: 'bar',
      options: {
        scales: {
          yAxes: [{
            ticks: {
              callback: function(value) {
                if (!(value % 10)) {
                  return '$' + value + 'k'
                }
              }
            }
          }]
        },
        tooltips: {
          callbacks: {
            label: function(item, data) {
              var label = data.datasets[item.datasetIndex].label || '';
              var yLabel = item.yLabel;
              var content = '';

              if (data.datasets.length > 1) {
                content += '<span class="popover-body-label mr-auto">' + label + '</span>';
              }

              content += '<span class="popover-body-value">$' + yLabel + 'k</span>';
              return content;
            }
          }
        }
      },
      data: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        datasets: [{
          label: 'Sales',
          data: [25, 20, 30, 22, 17, 10, 18, 26, 28, 26, 20, 32]
        }]
      }
    });
  }

  //
  // Events
  //

  if (chart) {
    init(chart);
  }

})();
