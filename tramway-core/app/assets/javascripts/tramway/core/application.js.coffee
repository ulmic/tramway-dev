#= require jquery
#= require jquery_ujs
#= require_tree .

$ ->
  unless $('.date_picker').length == 0
    $('.date_picker').datepicker({
      format: 'dd.mm.yyyy',
      language: 'ru'
    })

  $('.link').click ->
    location.href = $(this).data('href')
