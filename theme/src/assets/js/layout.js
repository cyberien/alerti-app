//
// Layout ==================================
// Demo code to toggle between light/dark modes
//

'use strict';

var Layout = (function() {

  //
  // Variables
  //

  var toggle = document.querySelector('#themeModeToggle');


  //
  // Methods
  //

  function updateToggleState() {
    if ( themeMode == 'dark' ) {
      toggle.checked = true;
    } else {
      toggle.checked = false;
    }
  }

  function toggleThemeMode() {

    // Update localStorage
    if ( toggle.checked == true ) {
      localStorage.setItem('dashkitThemeMode', 'dark');
    } else {
      localStorage.setItem('dashkitThemeMode', 'light');
    }

    // Reload window
    location.reload(true);
  }

  //
  // Events
  //

  if ( toggle ) {

    // Update toggle state
    window.addEventListener('load', function() {
      updateToggleState();
    });

    // Toggle theme mode
    toggle.addEventListener('change', function() {
      toggleThemeMode();
    });

  }

})();