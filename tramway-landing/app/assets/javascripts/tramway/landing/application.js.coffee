#= require tramway/core/application
#= require_tree .

$(document).ready ->
  $('.header-buttons').click ->
    anchor = $(this).data('anchor')
    $(window).scrollTop $(anchor).offset().top

  iframe_selectors_for_video = ['iframe[src*="vk.com"]', 'iframe[src*="youtu.be"]']
  for selector in iframe_selectors_for_video
    $(selector).each ->
      width = $(this).parents('div').first().width()
      height = width / 16 * 9
      $(this).width(width)
      $(this).height(height)
