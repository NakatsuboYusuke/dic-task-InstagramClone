window.addEventListener('DOMContentLoaded', () => {

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
