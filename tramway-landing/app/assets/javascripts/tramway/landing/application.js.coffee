#= require jquery
#= require jquery_ujs
#= require tramway/core/application
#= require_tree .

$(document).ready ->
  $('.header-buttons').click ->
    anchor = $(this).data('anchor')
    $(window).scrollTop $(anchor).offset().top
