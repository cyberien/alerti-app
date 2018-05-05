/**
 * Theme JS
 */

'use strict';


/*** Feather icons ***/

var Icons = (function() {

	// Variables

	var $feather = $('[data-feather]');

	// Functions

	function init() {
		feather.replace();
	}

	// Events

	if ( $feather.length ) {
		init();
	}
	
})();