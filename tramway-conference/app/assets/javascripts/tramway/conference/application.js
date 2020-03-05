//= require jquery
//= require jquery_ujs
//= require tramway/conference/jquery.scrollTo.min
//= require tramway/core/application
//= require_tree .

$.extend($.scrollTo.defaults, {
    axis: 'y',
    duration: 2000
})
$(document).ready(function() {
  $('.scroll').click(function(e) {
    e.preventDefault();
    $.scrollTo(`#${$(@).data('id')}`);
  });
});
