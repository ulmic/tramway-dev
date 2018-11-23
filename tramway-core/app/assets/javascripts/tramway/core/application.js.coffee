#= require jquery
#= require jquery_ujs
#= require bootstrap-datepicker-1.8.0
#= require bootstrap-datepicker-1.8.0.ru.min
#= require_tree .

$(document).ready ->
  unless $('.date_picker').length == 0
    $('.date_picker').datepicker({
      format: 'dd.mm.yyyy',
      language: 'ru'
    })

  $('.link').click ->
    href = $(this).data('href')
    if href
      location.href = href
    else
      anchor = $(this).data('anchor')
      console.log(anchor)
      $(window).scrollTop $(anchor).offset().top

