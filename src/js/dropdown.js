//
// dropdowns.js
// Dashkit module
//

const dropdowns = document.querySelectorAll('.dropup, .dropright, .dropdown, .dropleft');
const events = ['click'];

function toggleDropdown(e, dropdown) {
  const parentMenu = dropdown.closest('.dropdown-menu');

  if (parentMenu) {
    const currentMenu = dropdown.querySelector('.dropdown-menu');
    const siblingMenus = parentMenu.querySelectorAll('.dropdown-menu');

    siblingMenus.forEach(menu => {
      if (menu !== currentMenu) {
        menu.classList.remove('show');
      }
    });

    currentMenu.classList.toggle('show');
  }
}

function hideDropdowns(e, dropdown) {
  !e.clickEvent && e.preventDefault();

  const currentMenu = dropdown.querySelector('.dropdown-menu');
  const nestedMenus = currentMenu.querySelectorAll('.dropdown-menu');

  nestedMenus.forEach(menu => {
    menu.classList.remove('show');
  });
}

dropdowns.forEach(dropdown => {
  const toggle = dropdown.querySelector('[data-toggle="dropdown"]');

  toggle.addEventListener(events[0], e => {
    toggleDropdown(e, dropdown);
  });

  dropdown.addEventListener('hide.bs.dropdown', (e) => {
    hideDropdowns(e, dropdown);
  });
});
