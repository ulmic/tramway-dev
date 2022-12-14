//= require tramway/application
//= require_tree .

$(document).ready(function() {
  $('.header-buttons').click(function() {
    const anchor = $(this).data('anchor');
    $(window).scrollTop($(anchor).offset().top);
  });

  const iframe_selectors_for_video = ['iframe[src*="vk.com"]', 'iframe[src*="youtu.be"]', 'iframe[src*="youtube.com"]'];
  iframe_selectors_for_video.forEach(function(selector) {
    $(selector).each(function() {
      width = $(this).parents('div').first().width();
      height = width / 16 * 9;
      $(this).width(width);
      $(this).height(height);
    });
  })
});
