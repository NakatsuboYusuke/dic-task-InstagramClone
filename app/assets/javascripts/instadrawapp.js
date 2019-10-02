window.addEventListener('DOMContentLoaded', () => {

  // hamburger memu
  const hamburger = document.querySelector('.hamburger');
  hamburger.addEventListener('click', () => {
    hamburger.classList.toggle('is-active')
  });

  const wrapper = document.getElementById('wrapper');
  const navBtn = document.getElementById('nav-btn');

  navBtn.addEventListener('click', navToggle);
  function navToggle() {
    if (wrapper.classList.contains('nav-open')) {
      navCloseFunc();
    } else {
      navOpenFunc();
    }
  }

  const navOpenFunc = () => {
    wrapper.classList.add('nav-open');
  }
  const navCloseFunc = () => {
    wrapper.classList.remove('nav-open');
  }

  // modal
  const js_modal_open = document.getElementsByClassName('js-modal-open');

  for (let i = 0; i < js_modal_open.length; i++) {
    js_modal_open[i].addEventListener('click', (event) => {
      let target = js_modal_open[i].dataset.target;
      let modal = document.getElementById(target);
      $(modal).fadeIn(); // by jQuery
      return false;
    }, false);
  };

  const js_modal_close = document.getElementsByClassName('js-modal-close');

  for (let i = 0; i < js_modal_close.length; i++) {
    js_modal_close[i].addEventListener('click', (event) => {
      let target = js_modal_close[i].dataset.target;
      let modal = document.getElementById(target);
      $(modal).fadeOut(); // by jQuery
      return false;
    }, false);
  };

}, false);
