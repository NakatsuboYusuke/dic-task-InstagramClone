document.addEventListener('turbolinks:load', () => {
  document.querySelectorAll('.delete').forEach((a) => {
    a.addEventListener('ajax:success',() => {
      console.log(a);
      //a.style.display = "none";
    })
  })
})