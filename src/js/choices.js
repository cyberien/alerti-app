//
// choices.js
// Theme module
//

import Choices from 'choices.js';

const toggles = document.querySelectorAll('[data-choices]');

toggles.forEach(toggle => {
  const elementOptions = toggle.dataset.choices ? JSON.parse(toggle.dataset.choices) : {};

  const defaultOptions = {
    classNames: {
      containerInner: toggle.className,
      input: 'form-control',
      inputCloned: 'form-control-sm',
      list: 'none',
      listSingle: 'none',
      listDropdown: 'dropdown-menu',
      itemChoice: 'dropdown-item',
      activeState: 'show',
      selectedState: 'active'
    },
    shouldSort: false,
  };

  const options = {
    ...elementOptions,
    ...defaultOptions
  };

  new Choices(toggle, options);
});
