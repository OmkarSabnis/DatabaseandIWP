document.getElementById('toggleProfile').addEventListener('click', function () {
  [].map.call(document.querySelectorAll('.profile'), function(el) {
    el.classList.toggle('profile--open');
  });
});
document.getElementById('toggleProfile1').addEventListener('click', function () {
  [].map.call(document.querySelectorAll('.profile1'), function(el) {
    el.classList.toggle('profile--open');
  });
});
document.getElementById('toggleProfile2').addEventListener('click', function () {
  [].map.call(document.querySelectorAll('.profile2'), function(el) {
    el.classList.toggle('profile--open');
  });
});