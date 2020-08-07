//
// checklist.js
// Dashkit module
//

import { Sortable } from '@shopify/draggable';

const checklists = document.querySelectorAll('.checklist');

checklists.forEach(checklist => {
  new Sortable(checklist, {
    draggable: '.form-check',
    handle: '.form-check-label',
    mirror: {
      constrainDimensions: true
    }
  });
});